/**
 * 
 */
 
 function toggleAccordion(index) {
		      var panel = document.getElementsByClassName("panel")[index];
		      panel.style.display = (panel.style.display === "none") ? "block" : "none";
		    }
		
		    function addAccordion() {
		      var accordionContainer = document.getElementById("accordionContainer");
		
		      // Create new accordion elements
		      var accordion = document.createElement("button");
		      var panel = document.createElement("div");
		
		      // Assign classes and attributes
		      accordion.className = "accordion";
		      panel.className = "panel";
		      accordion.setAttribute("onclick", "toggleAccordion(" + (accordionContainer.childElementCount) + ")");
		
		      // Set accordion text and append to container
		      accordion.innerHTML = "Accordion " + (accordionContainer.childElementCount + 1);
		      accordionContainer.appendChild(accordion);
		
		      // Append panel to container
		      accordionContainer.appendChild(panel);
		    }
		    
		    // 시간 12시간 짜리 생성
		    var selectOptions= document.getElementById("time-selected-options");
		    for(var hour = 1; hour <= 12; hour++){
		    	var option = document.createElement("li");
		    	option.classList.add("option");
		    	option.textContent = hour + ":00";
		    	selectOptions.appendChild(option);
		    }
		    
		    const selectBoxElements = document.querySelectorAll(".time");
		    
		    function toggleSelectBox(selectBox) {
		    	selectBox.classList.toggle("active");
		    }
		    
		    function selectOption(optionElement){
		    	const selectBox = optionElement.closet(".time");
		    	const selectedElement = selectBox.querySelector(".time-selected-vaule");
		    	selectedElement.textContent = optionElement.textContent;
		    }
		    
		    selectBoxElements.forEach(selectBoxElement => {
		    	selecBoxElement.addEventListener("click", function(e){
		    		const targetElement = e.target;
		    		const isOptionElement = targetElement.classList.contains("li");
		    		
		    		if(isOptionElement){
		    			selectOption(targetElement);
		    		}
		    		
		    		toggleSelectBox(selectBoxElement);
		    	});
		    });
		    
		    document.addEventListener("click", function(e){
		    	const targetElement = e.target;
		    	const isSelect = targetElement.classList.contains("time") || targetElement.closet(".time");
		    	
		    	if(isSelect) {
		    		return
		    	}
		    	
		    	const allSelectBoxElements = document.querySelectorAll(".time");
		    	allSelectBoxElements.forEach(boxElement => {
		    		boxElement.classList.remove('active');
		    	});
		    });