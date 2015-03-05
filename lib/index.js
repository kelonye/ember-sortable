require('ember');
require('jquery-ui');

module.exports = function(options) {
  return Em.Mixin.create({
    tagName: 'ul',
    classNames: ['component-sortable'],
    setup: function() {
      var self = this;
      var controller = self.get('controller');
      options.update = function(event, ui) {
        var rows = self.$('> li').toArray();
        rows.forEach(function(row, position) {
          var view = Em.View.views[$(row).attr('id')];
          var item = view.get('content');
          item.set('__position__', position + 1);
        });
      };
      var el = $(this.$());
      el.sortable(options);
    }.on('didInsertElement')
  });
};
