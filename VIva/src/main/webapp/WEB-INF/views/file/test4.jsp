<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">

<head>
  <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
  <title>Click Add Tag Demo</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@yaireo/tagify@3.1.0/dist/tagify.css" />
  <script src="https://cdn.jsdelivr.net/npm/@yaireo/tagify@3.1.0/dist/tagify.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.4.1/dist/jquery.min.js"></script>
</head>

<body>
  <input type="text" name='basic' value="tag1, tag2" />
  <button id="click">add tags</button>
  <script>
    var input = document.querySelector('input[name=basic]');

    var tagify = new Tagify(input);


    $("#click").on("click", function() {
      var n = "ADD_IT_" + Math.random();
      var tags = [];
      tags.push(n);
      tagify.addTags(tags);
    })
  </script>
</body>

</html>