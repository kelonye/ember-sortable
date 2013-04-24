require 'ember'

module.exports = (options)->

  Em.Mixin.create

    tagName: 'ul'
    classNames: ['component-sortable']
    didInsertElement: ->
      
      require 'jquery-ui'

      that = @
      controller = that.get 'controller'

      options.update = (event, ui) ->
        rows = that.$('> li').toArray()
        rows.forEach (row, position)->
          view = Em.View.views[$(row).attr('id')]
          item = view.get 'content'
          item.set '__position__', (position + 1)

      el = @$()
      el.sortable options

      #el.disableSelection()
