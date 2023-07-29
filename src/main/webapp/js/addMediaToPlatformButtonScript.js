let addToPlatformButton = document.getElementById("add_to_platform_button");

function changeButtonText(element) {
  addToPlatformButton.innerHTML = `Add new media to ${element.innerHTML}`;
}