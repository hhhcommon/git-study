(function(a){function b(d,e){if(e){var c=Number.MAX_VALUE;d.sort(function(g,f){g=g.record.get(e)||c;f=f.record.get(e)||c;if(isNaN(g)||isNaN(f)){return g>f?1:-1}else{return g-f}})}else{d.sort()}Ext.each(d,function(f){b(f.children,e)})}a.MenuTree=Ext.extend(a.Component,{initComponent:function(c){var d=this;a.MenuTree.superclass.initComponent.call(d,c);d.body=d.wrap.child(".menu-tree-body")},processDataSetLiestener:function(c){var d=this,e=d.dataset;if(e){e[c]("update",d.onUpdate,d);e[c]("load",d.onLoad,d)}},bind:function(d){if(Ext.isString(d)){d=$(d);if(!d){return}}var c=this;c.dataset=d;c.processDataSetLiestener("on");c.onLoad()},onLoad:function(){var c=this,d=c.buildMenuTree();if(!d.length){return}c.body.update(c.render(d))},buildMenuTree:function(){var h=this,j=[],g={},f={},e=1,c=h.dataset;Ext.each(c.data,function(i){var m=i.get(h.idfield);if(Ext.isEmpty(m)){m="EMPTY_"+e++}g[m]=f[m]={record:i,children:[]}});for(var l in f){var d=f[l],k=f[d.record.get(h.parentfield)];if(k){k.children.push(d);delete g[l]}}for(var l in g){j.push(f[l])}b(j,h.sequencefield);return j},render:function(d){var c=this,e=d.length-1;return d.map(function(j,h){var g=j.record,i=j.children,f=i.length-1;return['<table cellpadding="0" cellspacing="0" border="0" style="" class="',(h==e?"":"notlast"),'">','<tr height="25">','<td class="menu-tree-line-top" width="25">&#160;</td>','<td class="menu-tree-line-top-right" width="180">&#160;</td>','<td width="180"></td>',"</tr>","<tr>","<td></td>",'<td colspan="2" align="center">','<table height="15" cellpadding="0" cellspacing="0" border="0" class="menu-tree-node"><tr><td class="menu-tree-node-head">',c.renderText(g),"</td></tr></table>","</td>","</tr>",'<tr height="25">','<td width="25"></td>','<td class="menu-tree-line-right">&#160;</td>',"<td></td>","</tr>","<tr>",'<td width="25"></td>','<td colspan="2">','<table cellpadding="0" cellspacing="0" border="0" width="100%">','<tr height="25">',i.map(function(l,k){switch(k){case 0:return'<td width="180" class="menu-tree-line-right">&#160;</td><td width="180"'+(f?' class="menu-tree-line-top"':"")+">&#160;</td>";case f:return'<td width="180" class="menu-tree-line-top-right">&#160;</td><td width="180"></td>';default:return'<td width="180" class="menu-tree-line-top-right">&#160;</td><td width="180" class="menu-tree-line-top">&#160;</td>'}}).join(""),"</tr>","<tr>",i.map(function(l){var k=l.children;return['<td colspan="2" style="padding:0 5px" valign="top">','<table width="100%" cellpadding="0" cellspacing="0" border="0" class="menu-tree-node">',"<tr>",'<td class="menu-tree-node-head">',c.renderText(l.record),"</td>","</tr>","<tr>",'<td class="menu-tree-node-body">',"<ul>",k&&k.length?k.map(function(m){return["<li>",c.renderText(m.record),"</li>"].join("")}).join(""):"<li></li>","</ul>","</td>","</tr>","</table>","</td>"].join("")}).join(""),"</tr>","</table>","</td>","</tr>",'<tr height="25"></tr>',"</table>"].join("")}).join("")},renderText:function(e){var c=this,f=e.get(c.displayfield),d=c.renderer&&a.getRenderer(c.renderer);return d?d(f,e):f}});a.MenuTree.revision="$Rev: 8535 $"})($A);