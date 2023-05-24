<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
@import url('https://fonts.googleapis.com/icon?family=Material+Icons');

.dropdown-label{
  font-size : 12px;
  margin : 10px;
  font-weight : bold;
  color : rgb(50, 50, 50);
}

.dropdown{
  position : relative;
  display : inline-block;
}

.dropbtn_icon{
  font-family : 'Material Icons';
}
.dropbtn{
  display : block;
  border : 2px solid rgb(94, 94, 94);
  border-radius : 4px;
  background-color: #fcfcfc;
  font-weight: 400;
  color : rgb(124, 124, 124);
  padding : 12px;
  width :240px;
  text-align: left;
  cursor : pointer;
  font-size : 12px;
  z-index :1;
  position : relative;
}
.dropdown-content{
  display : none;
  font-weight: 400;
  background-color: #fcfcfc;
  min-width : 240px;
  border-radius: 8px;
  height : 160px;
  overflow : scroll;
  box-shadow: 0px 0px 10px 3px rgba(190, 190, 190, 0.6);
}
.dropdown-content::-webkit-scrollbar{
  width : 5px;
  height : 10px;
}
.dropdown-content::-webkit-scrollbar-thumb{
  border-radius : 2px;
  background-color :rgb(194, 194, 194)
}

.dropdown-content div{
  display : block;
  text-decoration : none;
  color : rgb(37, 37, 37);
  font-size: 12px;
  padding : 12px 20px;
}
.dropdown-content div:hover{
  background-color: rgb(226, 226, 226);
}

.dropdown-content.show{
  display : block;
}

</style>
<script type="text/javascript">
window.onload=()=>{
    document.querySelector('.dropbtn_click').onclick = ()=>{
      dropdown();
    }
    document.getElementsByClassName('fastfood').onclick = ()=>{
      showMenu(value);
    };
    dropdown = () => {
      var v = document.querySelector('.dropdown-content');
      var dropbtn = document.querySelector('.dropbtn')
      v.classList.toggle('show');
      dropbtn.style.borderColor = 'rgb(94, 94, 94)';
    }

    showMenu=(value)=>{
      var dropbtn_icon = document.querySelector('.dropbtn_icon');
      var dropbtn_content = document.querySelector('.dropbtn_content');
      var dropbtn_click = document.querySelector('.dropbtn_click');
      var dropbtn = document.querySelector('.dropbtn');

      dropbtn_icon.innerText = '';
      dropbtn_content.innerText = value;
      dropbtn_content.style.color = '#252525';
      dropbtn.style.borderColor = '#3992a8';
    }
  }
  window.onclick= (e)=>{
    if(!e.target.matches('.dropbtn_click')){
      var dropdowns = document.getElementsByClassName("dropdown-content");

      var dropbtn_icon = document.querySelector('.dropbtn_icon');
      var dropbtn_content = document.querySelector('.dropbtn_content');
      var dropbtn_click = document.querySelector('.dropbtn_click');
      var dropbtn = document.querySelector('.dropbtn');

      var i;
      for (i = 0; i < dropdowns.length; i++) {
        var openDropdown = dropdowns[i];
        if (openDropdown.classList.contains('show')) {
          openDropdown.classList.remove('show');
        }
      }
    }
  }

</script>
</head>


<body>

<div class="dropdown-label">
    Lunch Menus
    <span style="font-family: Material Icons;">restaurant</span>
  </div>
  <div class="dropdown">
    <button class="dropbtn">
      <span class="dropbtn_icon">more_horiz</span>
      <span class="dropbtn_content">Select a menu...</span>
      <span class="dropbtn_click" style="font-family: Material Icons; font-size : 16px; color : #3b3b3b; float:right;"
        onclick="dropdown()">arrow_drop_down</span>
    </button>
    <div class="dropdown-content">
      <div class="fastfood" onclick="showMenu(this.innerText)">Burgerking</div>
      <div class="fastfood" onclick="showMenu(this.innerText)">Mcdonals</div>
      <div class="fastfood" onclick="showMenu(this.innerText)">Lotteria</div>
      <div class="fastfood" onclick="showMenu(this.innerText)">Mom's touch</div>
      <div class="fastfood" onclick="showMenu(this.innerText)">In n out</div>
      <div class="fastfood" onclick="showMenu(this.innerText)">Subway</div>
      <div class="fastfood" onclick="showMenu(this.innerText)">Shake shack</div>
    </div>
  </div>
</body>
</html>