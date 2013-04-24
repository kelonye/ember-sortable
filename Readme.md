Install
---

```
component install kelonye/ember-sortable
```

Usage
----------

See [demo](http://kelonye.github.com/ember-sortable/example/index.html)

Api
---

Params

  * options: options to pass to sortable method

Example
---

```
App.SortableController = Em.ArrayController.extend
  content:[
    {
      'score': 1,
      'name': '..' 
    }
  ].map (content, index, self)->
    Em.Object.create content,
      init: ->
        Em.addObserver @, '__position__', ->
          position = @get '__position__'
          @set 'score', position

App.SortableItemView = Em.View.extend
  tagName: 'li'
  template: compile """
    {{#with view.content}}
    {{content}}
    <em>{{score}}</em>
    {{/with}}
  """

App.SortableView = Em.CollectionView.extend require('ember-sortable')({axis:'y'}),
  contentBinding: 'controller.content'
  itemViewClass: App.SortableItemView
```

License
---

MIT