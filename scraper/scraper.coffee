environment = process.env.NODE_ENV || 'development'

_ = require 'underscore'
fs = require 'fs'
async = require 'async'
cheerio = require 'cheerio'
request = require 'request'

module.exports = class Scraper
  constructor: ->
    @categories = [ '/cat/9/',
                    '/cat/4226/',
                    '/cat/11/',
                    '/cat/12/',
                    '/cat/13/',
                    '/cat/14/',
                    '/cat/4227/',
                    '/cat/161/',
                    '/cat/157/',
                    '/cat/53/',
                    '/cat/15/',
                    '/cat/120/',
                    '/cat/16/',
                    '/cat/151/' ]

  index: (callback) ->
    categories = _.map @categories, (category) =>
      (callback) =>
        category_name = category.replace /\//g, ''

        @index_category category, [category], (error, pages) =>
          console.dir pages

          drinks = _.map pages, (page) =>
            (callback) =>
              @index_page page, process.argv[2] + category_name + '.json', callback

          async.series drinks, (error, drinks) =>
            console.log error if error
            callback null, drinks

    async.series categories, (error, results) =>
      callback()

  index_category: (page, pages, callback) ->
    console.dir 'Category Page: ' + page

    request 'http://www.drinksmixer.com' + page, (error, response, body) =>
      $ = cheerio.load body

      if (/\/cat\/\d+\/$/.test(page)) || $('.wrapper .co .m1 .min .pm .brw .fl4 a img').length == 4
        next_page = $(_.last($('.wrapper .co .m1 .min .pm .brw .fl4 a')))
        if next_page[0] == undefined
          callback null, pages
        else
          pages.push next_page[0].attribs.href
          @index_category _.last(pages), pages, callback
      else
        callback null, pages

  index_page: (page, file, callback) ->
    console.dir 'Index Page: ' + page

    request 'http://www.drinksmixer.com' + page, (error, response, body) =>
      $ = cheerio.load body

      pages = _.map $('.clr .l1a a'), (a) =>
        (callback) =>
          @index_drink_page a.attribs.href, file, callback

      async.series pages, (errors, results) =>
        console.log error if error
        callback errors, results

  index_drink_page: (page, file, callback) ->
    # console.dir 'Drink Page: ' + page
    process.stdout.write '.'

    request 'http://www.drinksmixer.com/' + page, (error, response, body) =>
      $ = cheerio.load body

      name = $('h1.recipe_title').text().replace(/recipe$/, '').trim()
      description = $('div.RecipeDirections').text()
      instructions = $('div.instructions').text()
      description = null if description == instructions
      ingredients = _.map($('span.ingredient'), (i) => @parse_ingredient($(i).text()))
      glass = $('.recipeStats a img')[0].attribs.title

      drink =
        name: name
        description: description
        instructions: instructions
        ingredients: ingredients
        glass: glass

      fs.appendFile file, JSON.stringify(drink) + "\n", (error) ->
        callback(null, drink)

  parse_ingredient: (ingredient) ->
    ingredient = ingredient.trim()

    amount_unit_name = /([\d\\]+)?\s+([\w-]+)\s+(.*)/
    amount_name = /([\d\\]+)\s+(.*)/

    if amount_unit_name.test ingredient
      match = amount_unit_name.exec ingredient
      {amount:match[1], unit:match[2], name:match[3]}
    else if amount_name.test ingredient
      match = amount_name.exec ingredient
      {amount:match[1], unit:null, name:match[2]}
    else
      {amount:null, unit:null, name:ingredient.trim()}


if process.argv[1] == __filename
  scraper = new Scraper
  scraper.index () ->
    console.log 'DONE!'
