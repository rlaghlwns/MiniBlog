function backgroundColorChange(id, colorTarget, choise) {
   let pickedColor = document.getElementById(colorTarget).value;
   var id = document.getElementById(id);
   id.style.backgroundColor = `${pickedColor}`;
   var color = pickedColor;
   if (choise == "show1box") {
      document.all.show1box.value = color;
   } else if (choise == "show2box") {
      document.all.show2box.value = color;
   } else if (choise == "show3box") {
      document.all.show3box.value = color;
   } else if (choise == "show4box") {
      document.all.show4box.value = color;
   } else {
      console.log("nothing");
   }
}

function fontStyleChange(selectedid, font) {
   let pickedFont = document.getElementById(font).value;
   console.log(pickedFont);
   var tag = document.getElementById(selectedid);
   var style=pickedFont
   console.log(tag);
   tag.style.fontFamily = `${pickedFont}`;
      document.all.show1style.value = style;
}

function fontColorChange(id, colorTarget, choise) {
   let pickedColor = document.getElementById(colorTarget).value;
   var id = document.getElementById(id);
   id.style.color = `${pickedColor}`;
   id.style.border = "2px solid black";
   var font=pickedColor
      document.all.show1font.value = font;   
}

function fontSizeChange(selectedid, sizeTarget) {
   let pickedSize = document.getElementById(sizeTarget).value;
   var tag = document.getElementById(selectedid);
   var size=pickedSize;
   tag.style.fontSize = `${pickedSize}px`;
      document.all.show1size.value = size;   
}

function fontAlignChange(selectedid, alignTarget) {
   let pickedAlign = document.getElementById(alignTarget).value;
   console.log(pickedAlign);
   var tag = document.getElementById(selectedid);
   var align=pickedAlign;
   console.log(tag);
   tag.style.textAlign = `${pickedAlign}`;
      document.all.show1align.value = align;

}