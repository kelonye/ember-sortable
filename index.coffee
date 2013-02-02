get = Em.get
set = Em.set

module.exports = (options)->

  Em.Mixin.create

    tagName: 'ul'
    classNames: ['sortable']
    didInsertElement: ->
      
      require 'jquery-ui'

      that = @
      controller = get that, 'controller'

      options.update = (event, ui) ->
        rows = that.$('> li').toArray()
        rows.forEach (row, position)->
          view = Em.View.views[$(row).attr('id')]
          item = get view, 'content'
          controller = get that, 'controller'
          controller.updateItem item, position+1

      el = @$()
      el.sortable options

      #el.disableSelection()
