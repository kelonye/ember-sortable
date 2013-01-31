Install
---

```
component install kelonye/ember-sortable
```

Example
---

```
App.SortableController = Em.ArrayController.extend
  content:[
    {
      'score': 1,
      'name': '..' 
    }
  ]
  updateItem: (item, position)->
    set item, 'score', position

App.SortableItemView = Em.View.extend
  tagName: 'li'
  template: compile """
    {{#with view.content}}
    {{content}}
    <em>{{score}}</em>
    {{/with}}
  """

App.SortableView = Em.CollectionView.extend require('ember-sortable'),
  contentBinding: 'controller.content'
  itemViewClass: App.SortableItemView
```

License
---

MIT