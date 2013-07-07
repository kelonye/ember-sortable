require('ember');
require('jquery-ui');

module.exports = function(options) {
  return Em.Mixin.create({
    tagName: 'ul',
    classNames: ['component-sortable'],
    didInsertElement: function() {
      var that = this;
      var controller = that.get('controller');
      options.update = function(event, ui) {
        var rows = that.$('> li').toArray();
        rows.forEach(function(row, position) {
          var view = Em.View.views[$(row).attr('id')];
          var item = view.get('content');
          item.set('__position__', position + 1);
        });
      };
      el = this.$();
      el.sortable(options);
    }
  });
};
