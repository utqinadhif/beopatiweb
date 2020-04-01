(function(m){"object"==typeof exports&&"object"==typeof module?m(require("../../lib/codemirror")):"function"==typeof define&&define.amd?define(["../../lib/codemirror"],m):m(CodeMirror)})(function(m){function p(c,a){var b=c.flags;for(var d=b=null!=b?b:(c.ignoreCase?"i":"")+(c.global?"g":"")+(c.multiline?"m":""),e=0;e<a.length;e++)-1==d.indexOf(a.charAt(e))&&(d+=a.charAt(e));return b==d?c:new RegExp(c.source,d)}function v(c,a,b){a=p(a,"g");var d=b.line,e=b.ch;for(b=c.lastLine();d<=b;d++,e=0)if(a.lastIndex=e,e=c.getLine(d),e=a.exec(e))return{from:h(d,e.index),to:h(d,e.index+e[0].length),match:e}}function x(c,a,b){if(!/\\s|\\n|\n|\\W|\\D|\[\^/.test(a.source))return v(c,a,b);a=p(a,"gm");for(var d,e=1,f=b.line,n=c.lastLine();f<=n;){for(var g=0;g<e&&!(f>n);g++){var k=c.getLine(f++);d=null==d?k:d+"\n"+k}e*=2;a.lastIndex=b.ch;if(g=a.exec(d))return a=d.slice(0,g.index).split("\n"),c=g[0].split("\n"),b=b.line+a.length-1,a=a[a.length-1].length,{from:h(b,a),to:h(b+c.length-1,1==c.length?a+c[0].length:c[c.length-1].length),match:g}}}function w(c,a){for(var b=0,d;;){a.lastIndex=b;b=a.exec(c);if(!b)return d;d=b;b=d.index+(d[0].length||1);if(b==c.length)return d}}function y(c,a,b){a=p(a,"g");var d=b.line,e=b.ch;for(b=c.firstLine();d>=b;d--,e=-1){var f=c.getLine(d);-1<e&&(f=f.slice(0,e));if(e=w(f,a))return{from:h(d,e.index),to:h(d,e.index+e[0].length),match:e}}}function z(c,a,b){a=p(a,"gm");for(var d,e=1,f=b.line,n=c.firstLine();f>=n;){for(var g=0;g<e;g++){var k=c.getLine(f--);d=null==d?k.slice(0,b.ch):k+"\n"+d}e*=2;if(g=w(d,a))return a=d.slice(0,g.index).split("\n"),c=g[0].split("\n"),f+=a.length,a=a[a.length-1].length,{from:h(f,a),to:h(f+c.length-1,1==c.length?a+c[0].length:c[c.length-1].length),match:g}}}function q(c,a,b,d){if(c.length==a.length)return b;var e=0;for(a=b+Math.max(0,c.length-a.length);;){if(e==a)return e;var f=e+a>>1,h=d(c.slice(0,f)).length;if(h==b)return f;h>b?a=f:e=f+1}}function A(c,a,b,d){if(!a.length)return null;d=d?r:t;a=d(a).split(/\r|\n\r?/);var e=b.line;b=b.ch;var f=c.lastLine()+1-a.length;a:for(;e<=f;e++,b=0){var n=c.getLine(e).slice(b),g=d(n);if(1==a.length){var k=g.indexOf(a[0]);if(-1==k)continue a;q(n,g,k,d);return{from:h(e,q(n,g,k,d)+b),to:h(e,q(n,g,k+a[0].length,d)+b)}}k=g.length-a[0].length;if(g.slice(k)!=a[0])continue a;for(var l=1;l<a.length-1;l++)if(d(c.getLine(e+l))!=a[l])continue a;l=c.getLine(e+a.length-1);var m=d(l),p=a[a.length-1];if(m.slice(0,p.length)!=p)continue a;return{from:h(e,q(n,g,k,d)+b),to:h(e+a.length-1,q(l,m,p.length,d))}}}function B(c,a,b,d){if(!a.length)return null;d=d?r:t;a=d(a).split(/\r|\n\r?/);var e=b.line,f=b.ch,n=c.firstLine()-1+a.length;a:for(;e>=n;e--,f=-1){var g=c.getLine(e);-1<f&&(g=g.slice(0,f));f=d(g);if(1==a.length){b=f.lastIndexOf(a[0]);if(-1==b)continue a;return{from:h(e,q(g,f,b,d)),to:h(e,q(g,f,b+a[0].length,d))}}var k=a[a.length-1];if(f.slice(0,k.length)!=k)continue a;var l=1;for(b=e-a.length+1;l<a.length-1;l++)if(d(c.getLine(b+l))!=a[l])continue a;b=c.getLine(e+1-a.length);l=d(b);if(l.slice(l.length-a[0].length)!=a[0])continue a;return{from:h(e+1-a.length,q(b,l,b.length-a[0].length,d)),to:h(e,q(g,f,k.length,d))}}}function u(c,a,b,d){this.atOccurrence=!1;this.doc=c;b=b?c.clipPos(b):h(0,0);this.pos={from:b,to:b};if("object"==typeof d)var e=d.caseFold;else e=d,d=null;"string"==typeof a?(null==e&&(e=!1),this.matches=function(b,d){return(b?B:A)(c,a,d,e)}):(a=p(a,"gm"),this.matches=d&&!1===d.multiline?function(b,d){return(b?y:v)(c,a,d)}:function(b,d){return(b?z:x)(c,a,d)})}var h=m.Pos;if(String.prototype.normalize){var r=function(c){return c.normalize("NFD").toLowerCase()};var t=function(c){return c.normalize("NFD")}}else r=function(c){return c.toLowerCase()},t=function(c){return c};u.prototype={findNext:function(){return this.find(!1)},findPrevious:function(){return this.find(!0)},find:function(c){for(var a=this.matches(c,this.doc.clipPos(c?this.pos.from:this.pos.to));a&&0==m.cmpPos(a.from,a.to);)c?a.from.ch?a.from=h(a.from.line,a.from.ch-1):a=a.from.line==this.doc.firstLine()?null:this.matches(c,this.doc.clipPos(h(a.from.line-1))):a.to.ch<this.doc.getLine(a.to.line).length?a.to=h(a.to.line,a.to.ch+1):a=a.to.line==this.doc.lastLine()?null:this.matches(c,h(a.to.line+1,0));if(a)return this.pos=a,this.atOccurrence=!0,this.pos.match||!0;c=h(c?this.doc.firstLine():this.doc.lastLine()+1,0);this.pos={from:c,to:c};return this.atOccurrence=!1},from:function(){if(this.atOccurrence)return this.pos.from},to:function(){if(this.atOccurrence)return this.pos.to},replace:function(c,a){if(this.atOccurrence){var b=m.splitLines(c);this.doc.replaceRange(b,this.pos.from,this.pos.to,a);this.pos.to=h(this.pos.from.line+b.length-1,b[b.length-1].length+(1==b.length?this.pos.from.ch:0))}}};m.defineExtension("getSearchCursor",function(c,a,b){return new u(this.doc,c,a,b)});m.defineDocExtension("getSearchCursor",function(c,a,b){return new u(this,c,a,b)});m.defineExtension("selectMatches",function(c,a){for(var b=[],d=this.getSearchCursor(c,this.getCursor("from"),a);d.findNext()&&!(0<m.cmpPos(d.to(),this.getCursor("to")));)b.push({anchor:d.from(),head:d.to()});b.length&&this.setSelections(b,0)})});