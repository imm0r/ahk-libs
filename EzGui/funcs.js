function formObject(formSelector) {
	let data = {}
	$(formSelector).serializeArray().map(function (x) { data[x.name] = x.value; })
	return data
}

function setDataToForm(e, data) {
	if (e.jquery) e = e[0]
	for (let property in data) {
		let element = e.querySelector("input[name="+property+"]")
		if (element) element.value = data[property]
	}
}

function random(min, max) {
	return Math.floor(Math.random() * (max - min)) + min;
}
function activate(status) {
	$(document.body).toggleClass("active", !!status)
}

function removeLoader() {
	document.getElementById("loader").classList.add("hide")
}

function refreshElement(e) {
	let parent = e.parent()
	let element = e.detach()
	parent.append(element)
}


function generateTemplates() {
	let templates = $("template")
	var object = {}
	templates.each(function() {
		const e = $(this)
		object[e.attr("name")] = e
	})
	return object
}
//kool jquery
jQuery.fn.reverse = [].reverse