// Inject classes
function notFound(x){
  console.log("no " + x + " found");
};
function injectClass(targetType, targetName, className) {
  var element;

  switch (targetType) {
    case "id": {
      const element = document.getElementById(targetName);
      for (i = 0; i < element.length; i++) {
        element[i].classList.add(className);
      }
      break;
    }
    case "class": {
      const element = document.getElementsByClassName(targetName);
      for (i = 0; i < element.length; i++) {
        element[i].classList.add(className);
      }
      break;
    }
    case "tag": {
      const element = document.getElementsByTagName(targetName);
      for (i = 0; i < element.length; i++) {
        element[i].classList.add(className);
      }
      break;
    }
  }
}

document.addEventListener("DOMContentLoaded", () => {

  injectClass("tag", "table", "dog");
  console.log("dog");

});