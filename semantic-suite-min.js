(function e(r,t,n){function i(u,f){if(!t[u]){if(!r[u]){var s=typeof require=="function"&&require;if(!f&&s)return s(u,!0);if(o)return o(u,!0);throw new Error("Cannot find module '"+u+"'")}var a=t[u]={exports:{}};r[u][0].call(a.exports,function(e){var t=r[u][1][e];return i(t?t:e)},a,a.exports,e,r,t,n)}return t[u].exports}var o=typeof require=="function"&&require;for(var u=0;u<n.length;u++)i(n[u]);return i})({1:[function(e,r,t){var n="/";var i,o,u,f,s,a,c;f=e("require-directory");u=e("path");s=function(e){var r,t;t=/^([a-z\u00E0-\u00FC])|\s+([a-z\u00E0-\u00FC])/g;r=(""+e+" ").replace(t,function(e){return e.toUpperCase()});return r.trim()};i=function(t){var n,i;n=u.basename(t,u.extname(t));if(/^\./.test(n)||/bin\//.test(t)){return false}else if(/reporter\//.test(t)){return true}else{i=s(n);r.exports[i]=e(t);return false}};c=f(r,n,i);for(o in c){a=c[o];r.exports[o]=a}},{path:4,"require-directory":7}],2:[function(e,r,t){var n=Object.prototype.toString;var i=Object.prototype.hasOwnProperty;function o(e){return n.call(e)==="[object Array]"}t.isArray=typeof Array.isArray==="function"?Array.isArray:o;t.indexOf=function v(e,r){if(e.indexOf)return e.indexOf(r);for(var t=0;t<e.length;t++){if(r===e[t])return t}return-1};t.filter=function d(e,r){if(e.filter)return e.filter(r);var t=[];for(var n=0;n<e.length;n++){if(r(e[n],n,e))t.push(e[n])}return t};t.forEach=function h(e,r,t){if(e.forEach)return e.forEach(r,t);for(var n=0;n<e.length;n++){r.call(t,e[n],n,e)}};t.map=function b(e,r){if(e.map)return e.map(r);var t=new Array(e.length);for(var n=0;n<e.length;n++){t[n]=r(e[n],n,e)}return t};t.reduce=function m(e,r,t){if(e.reduce)return e.reduce(r,t);var n,i=false;if(2<arguments.length){n=t;i=true}for(var o=0,u=e.length;u>o;++o){if(e.hasOwnProperty(o)){if(i){n=r(n,e[o],o,e)}else{n=e[o];i=true}}}return n};if("ab".substr(-1)!=="b"){t.substr=function(e,r,t){if(r<0)r=e.length+r;return e.substr(r,t)}}else{t.substr=function(e,r,t){return e.substr(r,t)}}t.trim=function(e){if(e.trim)return e.trim();return e.replace(/^\s+|\s+$/g,"")};t.bind=function(){var e=Array.prototype.slice.call(arguments);var r=e.shift();if(r.bind)return r.bind.apply(r,e);var t=e.shift();return function(){r.apply(t,e.concat([Array.prototype.slice.call(arguments)]))}};function u(e,r){var t;if(e===null){t={__proto__:null}}else{if(typeof e!=="object"){throw new TypeError("typeof prototype["+typeof e+"] != 'object'")}var n=function(){};n.prototype=e;t=new n;t.__proto__=e}if(typeof r!=="undefined"&&Object.defineProperties){Object.defineProperties(t,r)}return t}t.create=typeof Object.create==="function"?Object.create:u;function f(e){return typeof e!="object"&&typeof e!="function"||e===null}function s(e){if(f(e)){throw new TypeError("Object.keys called on a non-object")}var r=[];for(var t in e){if(i.call(e,t)){r.push(t)}}return r}function a(e){if(f(e)){throw new TypeError("Object.getOwnPropertyNames called on a non-object")}var r=s(e);if(t.isArray(e)&&t.indexOf(e,"length")===-1){r.push("length")}return r}var c=typeof Object.keys==="function"?Object.keys:s;var l=typeof Object.getOwnPropertyNames==="function"?Object.getOwnPropertyNames:a;if((new Error).hasOwnProperty("description")){var p=function(e,r){if(n.call(e)==="[object Error]"){r=t.filter(r,function(e){return e!=="description"&&e!=="number"&&e!=="message"})}return r};t.keys=function(e){return p(e,c(e))};t.getOwnPropertyNames=function(e){return p(e,l(e))}}else{t.keys=c;t.getOwnPropertyNames=l}function y(e,r){return{value:e[r]}}if(typeof Object.getOwnPropertyDescriptor==="function"){try{Object.getOwnPropertyDescriptor({a:1},"a");t.getOwnPropertyDescriptor=Object.getOwnPropertyDescriptor}catch(g){t.getOwnPropertyDescriptor=function(e,r){try{return Object.getOwnPropertyDescriptor(e,r)}catch(t){return y(e,r)}}}}else{t.getOwnPropertyDescriptor=y}},{}],3:[function(e,r,t){},{}],4:[function(e,r,t){var n=e("__browserify_process");var i=e("util");var o=e("_shims");function u(e,r){var t=0;for(var n=e.length-1;n>=0;n--){var i=e[n];if(i==="."){e.splice(n,1)}else if(i===".."){e.splice(n,1);t++}else if(t){e.splice(n,1);t--}}if(r){for(;t--;t){e.unshift("..")}}return e}var f=/^(\/?|)([\s\S]*?)((?:\.{1,2}|[^\/]+?|)(\.[^.\/]*|))(?:[\/]*)$/;var s=function(e){return f.exec(e).slice(1)};t.resolve=function(){var e="",r=false;for(var t=arguments.length-1;t>=-1&&!r;t--){var f=t>=0?arguments[t]:n.cwd();if(!i.isString(f)){throw new TypeError("Arguments to path.resolve must be strings")}else if(!f){continue}e=f+"/"+e;r=f.charAt(0)==="/"}e=u(o.filter(e.split("/"),function(e){return!!e}),!r).join("/");return(r?"/":"")+e||"."};t.normalize=function(e){var r=t.isAbsolute(e),n=o.substr(e,-1)==="/";e=u(o.filter(e.split("/"),function(e){return!!e}),!r).join("/");if(!e&&!r){e="."}if(e&&n){e+="/"}return(r?"/":"")+e};t.isAbsolute=function(e){return e.charAt(0)==="/"};t.join=function(){var e=Array.prototype.slice.call(arguments,0);return t.normalize(o.filter(e,function(e,r){if(!i.isString(e)){throw new TypeError("Arguments to path.join must be strings")}return e}).join("/"))};t.relative=function(e,r){e=t.resolve(e).substr(1);r=t.resolve(r).substr(1);function n(e){var r=0;for(;r<e.length;r++){if(e[r]!=="")break}var t=e.length-1;for(;t>=0;t--){if(e[t]!=="")break}if(r>t)return[];return e.slice(r,t-r+1)}var i=n(e.split("/"));var o=n(r.split("/"));var u=Math.min(i.length,o.length);var f=u;for(var s=0;s<u;s++){if(i[s]!==o[s]){f=s;break}}var a=[];for(var s=f;s<i.length;s++){a.push("..")}a=a.concat(o.slice(f));return a.join("/")};t.sep="/";t.delimiter=":";t.dirname=function(e){var r=s(e),t=r[0],n=r[1];if(!t&&!n){return"."}if(n){n=n.substr(0,n.length-1)}return t+n};t.basename=function(e,r){var t=s(e)[2];if(r&&t.substr(-1*r.length)===r){t=t.substr(0,t.length-r.length)}return t};t.extname=function(e){return s(e)[3]}},{__browserify_process:6,_shims:2,util:5}],5:[function(e,r,t){var n=e("_shims");var i=/%[sdj%]/g;t.format=function(e){if(!w(e)){var r=[];for(var t=0;t<arguments.length;t++){r.push(o(arguments[t]))}return r.join(" ")}var t=1;var n=arguments;var u=n.length;var f=String(e).replace(i,function(e){if(e==="%%")return"%";if(t>=u)return e;switch(e){case"%s":return String(n[t++]);case"%d":return Number(n[t++]);case"%j":try{return JSON.stringify(n[t++])}catch(r){return"[Circular]"}default:return e}});for(var s=n[t];t<u;s=n[++t]){if(h(s)||!S(s)){f+=" "+s}else{f+=" "+o(s)}}return f};function o(e,r){var n={seen:[],stylize:f};if(arguments.length>=3)n.depth=arguments[2];if(arguments.length>=4)n.colors=arguments[3];if(d(r)){n.showHidden=r}else if(r){t._extend(n,r)}if(j(n.showHidden))n.showHidden=false;if(j(n.depth))n.depth=2;if(j(n.colors))n.colors=false;if(j(n.customInspect))n.customInspect=true;if(n.colors)n.stylize=u;return a(n,e,n.depth)}t.inspect=o;o.colors={bold:[1,22],italic:[3,23],underline:[4,24],inverse:[7,27],white:[37,39],grey:[90,39],black:[30,39],blue:[34,39],cyan:[36,39],green:[32,39],magenta:[35,39],red:[31,39],yellow:[33,39]};o.styles={special:"cyan",number:"yellow","boolean":"yellow",undefined:"grey","null":"bold",string:"green",date:"magenta",regexp:"red"};function u(e,r){var t=o.styles[r];if(t){return"["+o.colors[t][0]+"m"+e+"["+o.colors[t][1]+"m"}else{return e}}function f(e,r){return e}function s(e){var r={};n.forEach(e,function(e,t){r[e]=true});return r}function a(e,r,i){if(e.customInspect&&r&&A(r.inspect)&&r.inspect!==t.inspect&&!(r.constructor&&r.constructor.prototype===r)){var o=r.inspect(i);if(!w(o)){o=a(e,o,i)}return o}var u=c(e,r);if(u){return u}var f=n.keys(r);var d=s(f);if(e.showHidden){f=n.getOwnPropertyNames(r)}if(f.length===0){if(A(r)){var h=r.name?": "+r.name:"";return e.stylize("[Function"+h+"]","special")}if(x(r)){return e.stylize(RegExp.prototype.toString.call(r),"regexp")}if(E(r)){return e.stylize(Date.prototype.toString.call(r),"date")}if(z(r)){return l(r)}}var b="",m=false,O=["{","}"];if(v(r)){m=true;O=["[","]"]}if(A(r)){var j=r.name?": "+r.name:"";b=" [Function"+j+"]"}if(x(r)){b=" "+RegExp.prototype.toString.call(r)}if(E(r)){b=" "+Date.prototype.toUTCString.call(r)}if(z(r)){b=" "+l(r)}if(f.length===0&&(!m||r.length==0)){return O[0]+b+O[1]}if(i<0){if(x(r)){return e.stylize(RegExp.prototype.toString.call(r),"regexp")}else{return e.stylize("[Object]","special")}}e.seen.push(r);var S;if(m){S=p(e,r,i,d,f)}else{S=f.map(function(t){return y(e,r,i,d,t,m)})}e.seen.pop();return g(S,b,O)}function c(e,r){if(j(r))return e.stylize("undefined","undefined");if(w(r)){var t="'"+JSON.stringify(r).replace(/^"|"$/g,"").replace(/'/g,"\\'").replace(/\\"/g,'"')+"'";return e.stylize(t,"string")}if(m(r))return e.stylize(""+r,"number");if(d(r))return e.stylize(""+r,"boolean");if(h(r))return e.stylize("null","null")}function l(e){return"["+Error.prototype.toString.call(e)+"]"}function p(e,r,t,i,o){var u=[];for(var f=0,s=r.length;f<s;++f){if($(r,String(f))){u.push(y(e,r,t,i,String(f),true))}else{u.push("")}}n.forEach(o,function(n){if(!n.match(/^\d+$/)){u.push(y(e,r,t,i,n,true))}});return u}function y(e,r,t,i,o,u){var f,s,c;c=n.getOwnPropertyDescriptor(r,o)||{value:r[o]};if(c.get){if(c.set){s=e.stylize("[Getter/Setter]","special")}else{s=e.stylize("[Getter]","special")}}else{if(c.set){s=e.stylize("[Setter]","special")}}if(!$(i,o)){f="["+o+"]"}if(!s){if(n.indexOf(e.seen,c.value)<0){if(h(t)){s=a(e,c.value,null)}else{s=a(e,c.value,t-1)}if(s.indexOf("\n")>-1){if(u){s=s.split("\n").map(function(e){return"  "+e}).join("\n").substr(2)}else{s="\n"+s.split("\n").map(function(e){return"   "+e}).join("\n")}}}else{s=e.stylize("[Circular]","special")}}if(j(f)){if(u&&o.match(/^\d+$/)){return s}f=JSON.stringify(""+o);if(f.match(/^"([a-zA-Z_][a-zA-Z_0-9]*)"$/)){f=f.substr(1,f.length-2);f=e.stylize(f,"name")}else{f=f.replace(/'/g,"\\'").replace(/\\"/g,'"').replace(/(^"|"$)/g,"'");f=e.stylize(f,"string")}}return f+": "+s}function g(e,r,t){var i=0;var o=n.reduce(e,function(e,r){i++;if(r.indexOf("\n")>=0)i++;return e+r.replace(/\u001b\[\d\d?m/g,"").length+1},0);if(o>60){return t[0]+(r===""?"":r+"\n ")+" "+e.join(",\n  ")+" "+t[1]}return t[0]+r+" "+e.join(", ")+" "+t[1]}function v(e){return n.isArray(e)}t.isArray=v;function d(e){return typeof e==="boolean"}t.isBoolean=d;function h(e){return e===null}t.isNull=h;function b(e){return e==null}t.isNullOrUndefined=b;function m(e){return typeof e==="number"}t.isNumber=m;function w(e){return typeof e==="string"}t.isString=w;function O(e){return typeof e==="symbol"}t.isSymbol=O;function j(e){return e===void 0}t.isUndefined=j;function x(e){return S(e)&&D(e)==="[object RegExp]"}t.isRegExp=x;function S(e){return typeof e==="object"&&e}t.isObject=S;function E(e){return S(e)&&D(e)==="[object Date]"}t.isDate=E;function z(e){return S(e)&&D(e)==="[object Error]"}t.isError=z;function A(e){return typeof e==="function"}t.isFunction=A;function _(e){return e===null||typeof e==="boolean"||typeof e==="number"||typeof e==="string"||typeof e==="symbol"||typeof e==="undefined"}t.isPrimitive=_;function P(e){return e&&typeof e==="object"&&typeof e.copy==="function"&&typeof e.fill==="function"&&typeof e.binarySlice==="function"}t.isBuffer=P;function D(e){return Object.prototype.toString.call(e)}function k(e){return e<10?"0"+e.toString(10):e.toString(10)}var N=["Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"];function T(){var e=new Date;var r=[k(e.getHours()),k(e.getMinutes()),k(e.getSeconds())].join(":");return[e.getDate(),N[e.getMonth()],r].join(" ")}t.log=function(){console.log("%s - %s",T(),t.format.apply(t,arguments))};t.inherits=function(e,r){e.super_=r;e.prototype=n.create(r.prototype,{constructor:{value:e,enumerable:false,writable:true,configurable:true}})};t._extend=function(e,r){if(!r||!S(r))return e;var t=n.keys(r);var i=t.length;while(i--){e[t[i]]=r[t[i]]}return e};function $(e,r){return Object.prototype.hasOwnProperty.call(e,r)}},{_shims:2}],6:[function(e,r,t){var n=r.exports={};n.nextTick=function(){var e=typeof window!=="undefined"&&window.setImmediate;var r=typeof window!=="undefined"&&window.postMessage&&window.addEventListener;if(e){return function(e){return window.setImmediate(e)}}if(r){var t=[];window.addEventListener("message",function(e){var r=e.source;if((r===window||r===null)&&e.data==="process-tick"){e.stopPropagation();if(t.length>0){var n=t.shift();n()}}},true);return function n(e){t.push(e);window.postMessage("process-tick","*")}}return function i(e){setTimeout(e,0)}}();n.title="browser";n.browser=true;n.env={};n.argv=[];n.binding=function(e){throw new Error("process.binding is not supported")};n.cwd=function(){return"/"};n.chdir=function(e){throw new Error("process.chdir is not supported")}},{}],7:[function(e,r,t){var n=e("fs");var i=e("path").join;var o=e("path").resolve;var u=e("path").dirname;var f=r.exports=function(e,r,t,s){var a=function(e,r){return r[0]!=="."&&/\.(js|coffee)$/i.test(r)};var c=a;var l={};if(!r){r=u(e.filename)}if(t instanceof RegExp){c=function(e,r){if(!a(e,r)){return false}else if(t.test(e)){return false}else{return true}}}else if(t&&{}.toString.call(t)==="[object Function]"){c=t}r=o(r);n.readdirSync(r).forEach(function(t){var o=i(r,t);if(n.statSync(o).isDirectory()){l[t]=f(e,o,c,s)}else{if(o!==e.filename&&c(o,t)){var u=t.substring(0,t.lastIndexOf("."));l[u]=e.require(o);if(s&&typeof s=="function"){s(null,l[u])}}}});return l}},{fs:3,path:4}]},{},[1]);