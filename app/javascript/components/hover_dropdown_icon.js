
const dropdownMenuAppears = () => {
  const avatar = document.getElementById("navbarDropdown");
  if (avatar) {
    const dropdown = document.querySelector(".dropdown-menu");
    const dropdown_section = document.getElementById("dropdown-section")
    
    dropdown_section.addEventListener("mouseover", (event) => {
      dropdown.style.display = "block";
    });

    dropdown_section.addEventListener("mouseleave", (event) => {
      dropdown.style.display = "none";
    });
  };
}

export { dropdownMenuAppears };