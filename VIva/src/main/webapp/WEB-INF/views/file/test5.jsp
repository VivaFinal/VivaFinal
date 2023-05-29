<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<head>
  <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
  <title>Click Add Tag Demo</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@yaireo/tagify@3.1.0/dist/tagify.css" />
  <script src="https://cdn.jsdelivr.net/npm/@yaireo/tagify@3.1.0/dist/tagify.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.4.1/dist/jquery.min.js"></script>
  
  <style type="text/css">
  .tagify{    
  width: 100%;
  max-width: 700px;
}

.tags-look .tagify__dropdown__item{
  display: inline-block;
  border-radius: 3px;
  padding: .3em .5em;
  border: 1px solid #CCC;
  background: #F3F3F3;
  margin: .2em;
  font-size: .85em;
  color: black;
  transition: 0s;
}

.tags-look .tagify__dropdown__item--active{
  color: black;
}

.tags-look .tagify__dropdown__item:hover{
  background: lightyellow;
  border-color: gold;
}
  </style>
  
</head>

<body>
 <input name='tags' class='some_class_name' placeholder='write some tags' value='css, html, javascript'>
  <script>
  var inputElm = document.querySelector('input[name=tags]'),
  whitelist = ["Trap", "R&B", "Soul", "boombap", "Rock", "Jazz", "House", "Heavy Metal", "Funk", "Reggae", "Folk", "Electro", "House", "Disco", "Pop", "EDM", "Tropical House", "Drum and Bass", "Jungle"];


//initialize Tagify on the above input node reference
var tagify = new Tagify(inputElm, {
  enforceWhitelist: true,

  // make an array from the initial input value
  whitelist: inputElm.value.trim().split(/\s*,\s*/) 
})

//Chainable event listeners
tagify.on('add', onAddTag)
    .on('remove', onRemoveTag)
    .on('input', onInput)
    .on('edit', onTagEdit)
    .on('invalid', onInvalidTag)
    .on('click', onTagClick)
    .on('focus', onTagifyFocusBlur)
    .on('blur', onTagifyFocusBlur)
    .on('dropdown:hide dropdown:show', e => console.log(e.type))
    .on('dropdown:select', onDropdownSelect)

var mockAjax = (function mockAjax(){
  var timeout;
  return function(duration){
      clearTimeout(timeout); // abort last request
      return new Promise(function(resolve, reject){
          timeout = setTimeout(resolve, duration || 700, whitelist)
      })
  }
})()

//tag added callback
function onAddTag(e){
  console.log("onAddTag: ", e.detail);
  console.log("original input value: ", inputElm.value)
  tagify.off('add', onAddTag) // exmaple of removing a custom Tagify event
}

//tag remvoed callback
function onRemoveTag(e){
  console.log("onRemoveTag:", e.detail, "tagify instance value:", tagify.value)
}

//on character(s) added/removed (user is typing/deleting)
function onInput(e){
  console.log("onInput: ", e.detail);
  tagify.settings.whitelist.length = 0; // reset current whitelist
  tagify.loading(true).dropdown.hide.call(tagify) // show the loader animation

  // get new whitelist from a delayed mocked request (Promise)
  mockAjax()
      .then(function(result){
          // replace tagify "whitelist" array values with new values
          // and add back the ones already choses as Tags
          tagify.settings.whitelist.push(...result, ...tagify.value)

          // render the suggestions dropdown.
          tagify.loading(false).dropdown.show.call(tagify, e.detail.value);
      })
}

function onTagEdit(e){
  console.log("onTagEdit: ", e.detail);
}

//invalid tag added callback
function onInvalidTag(e){
  console.log("onInvalidTag: ", e.detail);
}

//invalid tag added callback
function onTagClick(e){
  console.log(e.detail);
  console.log("onTagClick: ", e.detail);
}

function onTagifyFocusBlur(e){
  console.log(e.type, "event fired")
}

function onDropdownSelect(e){
  console.log("onDropdownSelect: ", e.detail)
}
  </script>
</body>

</html>