$(document).ready(function () {
var data = [{"text":"Cover Page","icon":"images/folder.svg","href":"startpage.html","target":"DATA"},{"text":"Servers","icon":"images/folder.svg","href":"Servers\\Servers.html","target":"DATA"},{"text":"WIN-ONVEP099PGB","icon":"images/folder.svg","href":"Servers\\WIN-ONVEP099PGB\\WIN-ONVEP099PGB.html","target":"DATA","nodes":[{"text":"User databases","icon":"images/folder.svg","href":"Servers\\WIN-ONVEP099PGB\\UserDatabases\\UserDatabases.html","target":"DATA","nodes":[{"text":"academy","icon":"images/database.svg","href":"Servers\\WIN-ONVEP099PGB\\UserDatabases\\academy\\academy.html","target":"DATA","nodes":[{"text":"Tables","icon":"images/folder.svg","href":"Servers\\WIN-ONVEP099PGB\\UserDatabases\\academy\\Tables\\Tables.html","target":"DATA","nodes":[{"text":"dbo.accounts","icon":"images/table.svg","href":"Servers\\WIN-ONVEP099PGB\\UserDatabases\\academy\\Tables\\dbo.accounts.html","target":"DATA"},{"text":"dbo.active_learnings","icon":"images/table.svg","href":"Servers\\WIN-ONVEP099PGB\\UserDatabases\\academy\\Tables\\dbo.active_learnings.html","target":"DATA"},{"text":"dbo.courses","icon":"images/table.svg","href":"Servers\\WIN-ONVEP099PGB\\UserDatabases\\academy\\Tables\\dbo.courses.html","target":"DATA"},{"text":"dbo.learnings","icon":"images/table.svg","href":"Servers\\WIN-ONVEP099PGB\\UserDatabases\\academy\\Tables\\dbo.learnings.html","target":"DATA"},{"text":"dbo.positions","icon":"images/table.svg","href":"Servers\\WIN-ONVEP099PGB\\UserDatabases\\academy\\Tables\\dbo.positions.html","target":"DATA"},{"text":"dbo.status_course","icon":"images/table.svg","href":"Servers\\WIN-ONVEP099PGB\\UserDatabases\\academy\\Tables\\dbo.status_course.html","target":"DATA"},{"text":"dbo.status_learning","icon":"images/table.svg","href":"Servers\\WIN-ONVEP099PGB\\UserDatabases\\academy\\Tables\\dbo.status_learning.html","target":"DATA"},{"text":"dbo.students","icon":"images/table.svg","href":"Servers\\WIN-ONVEP099PGB\\UserDatabases\\academy\\Tables\\dbo.students.html","target":"DATA"},{"text":"dbo.transactions","icon":"images/table.svg","href":"Servers\\WIN-ONVEP099PGB\\UserDatabases\\academy\\Tables\\dbo.transactions.html","target":"DATA"}]}]}]}]}];
$('#tree').treeview({levels: 3,data: data,enableLinks: true,injectStyle: false,highlightSelected: true,collapseIcon: 'images/tree-node-expanded.svg',expandIcon: 'images/tree-node-collapsed.svg'});
});
var loadEvent = function () {

  $('#btn-expand-nodes').on('click', function (e) {
    $('#tree').treeview('expandAll', { silent: true });
  });
  $('#btn-collapse-nodes').on('click', function (e) {
    $('#tree').treeview('collapseAll', { levels:3, silent: true });
  });
  
  var searchTimeOut;
  $('#input-search').on('input', function() {
    if(searchTimeOut != null)
      clearTimeout(searchTimeOut);
    searchTimeOut = setTimeout(function(){
      var pattern = $('#input-search').val();
      var tree = $('#tree');
      tree.treeview('collapseAll', { levels:3, silent: true });
      var options = { ignoreCase: true, exactMatch: false, revealResults: true };
      var results = tree.treeview('search', [pattern, options]);
    }, 500);
  });
  
  $('#tree').on('nodeSelected', function(event, data) {
    // navigate to link
    window.open (data.href, 'DATA', false)
  });
  // select first node.
  $('#tree').treeview('selectNode', [0, { silent: false }]);
}

if (window.addEventListener) {
  window.addEventListener('load', loadEvent, false);
}
else if (window.attachEvent) {
  window.attachEvent('onload', loadEvent);
}