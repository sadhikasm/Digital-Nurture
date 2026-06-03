// ======================================
// EXERCISE 1 - JavaScript Basics
// ======================================

console.log("Welcome to the Community Portal");

window.onload = function () {
    alert("Community Portal Loaded Successfully");
};

// ======================================
// EXERCISE 2 - Variables & Operators
// ======================================

const eventName = "Music Event";
const eventDate = "15-06-2026";
let seats = 50;

console.log(`Event: ${eventName}
Date: ${eventDate}
Seats: ${seats}`);

// ======================================
// EXERCISE 3 - Conditionals, Loops & Error Handling
// ======================================

let events = [
    {
        name: "Music Event",
        category: "Music",
        seats: 50,
        upcoming: true
    },
    {
        name: "Food Festival",
        category: "Food",
        seats: 30,
        upcoming: true
    },
    {
        name: "Sports Day",
        category: "Sports",
        seats: 0,
        upcoming: false
    }
];

events.forEach(function (event) {

    if (event.upcoming && event.seats > 0) {
        console.log(event.name);
    }
    else {
        console.log(event.name + " Hidden");
    }

});

// ======================================
// EXERCISE 4 - Functions, Closures
// ======================================

function addEvent(event) {
    events.push(event);
}

function filterEventsByCategory(category) {

    return events.filter(function (event) {
        return event.category === category;
    });
}

function registrationCounter() {

    let count = 0;

    return function () {
        count++;
        return count;
    };
}

let counter = registrationCounter();

function searchEvents(callback) {
    callback(events);
}

// ======================================
// EXERCISE 5 - Objects & Prototype
// ======================================

function Event(name, seats) {

    this.name = name;
    this.seats = seats;
}

Event.prototype.checkAvailability = function () {

    if (this.seats > 0) {
        return "Available";
    }

    return "Full";
};

let e1 = new Event("Art Show", 20);

console.log(e1.checkAvailability());

Object.entries(e1).forEach(function (item) {

    console.log(item[0], item[1]);

});

// ======================================
// EXERCISE 6 - Arrays & Methods
// ======================================

events.push({
    name: "Workshop on Baking",
    category: "Food",
    seats: 40
});

let musicEvents =
events.filter(function (event) {
    return event.category === "Music";
});

console.log(musicEvents);

let eventNames =
events.map(function (event) {
    return "Workshop on " + event.name;
});

console.log(eventNames);

// ======================================
// EXERCISE 7 - DOM Manipulation
// ======================================

function displayEvents() {

    let section =
    document.querySelector("#events");

    let div =
    document.createElement("div");

    div.id = "eventCards";

    events.forEach(function (event) {

        let p =
        document.createElement("p");

        p.innerHTML =
        event.name +
        " - Seats: " +
        event.seats;

        div.appendChild(p);
    });

    section.appendChild(div);
}

// ======================================
// EXERCISE 8 - Event Handling
// ======================================

document.addEventListener(
    "keydown",
    function (event) {

        console.log("Key Pressed: " + event.key);
    }
);

// ======================================
// EXERCISE 9 - Promises
// ======================================

function fetchEvents() {

    fetch("https://jsonplaceholder.typicode.com/posts")

        .then(function (response) {
            return response.json();
        })

        .then(function (data) {
            console.log(data);
        })

        .catch(function (error) {
            console.log(error);
        });
}

// Async / Await

async function loadData() {

    try {

        console.log("Loading...");

        let response =
        await fetch(
            "https://jsonplaceholder.typicode.com/posts"
        );

        let data =
        await response.json();

        console.log(data);

    }

    catch (error) {

        console.log(error);
    }
}

// ======================================
// EXERCISE 10 - Modern JavaScript
// ======================================

function welcome(name = "Guest") {

    console.log("Welcome " + name);
}

let eventInfo = {

    title: "Music Event",
    seatsAvailable: 50
};

let { title, seatsAvailable } =
eventInfo;

console.log(title);

let copiedEvents = [...events];

// ======================================
// EXERCISE 11 - Form Validation
// ======================================

let form =
document.querySelector("form");

form.addEventListener(
    "submit",
    function (event) {

        event.preventDefault();

        let name =
        form.elements[0].value.trim();

        let email =
        form.elements[1].value.trim();

        let selectedEvent =
        form.elements[3].value;

        let namePattern =
        /^[A-Za-z ]+$/;

        let emailPattern =
        /^[a-zA-Z0-9._]+@[a-zA-Z]+\.[a-zA-Z]{2,}$/;

        if (name === "") {
            alert("Enter Name");
            return;
        }

        if (!namePattern.test(name)) {
            alert("Enter Valid Name");
            return;
        }

        if (email === "") {
            alert("Enter Email");
            return;
        }

        if (!emailPattern.test(email)) {
            alert("Enter Valid Email");
            return;
        }

        if (selectedEvent === "Select Event") {
            alert("Select Event");
            return;
        }

        alert("Form Submitted Successfully");
    }
);

// ======================================
// EXERCISE 12 - AJAX & Fetch API
// ======================================

function submitRegistration() {

    let user = {

        name: "Sai",
        email: "sai@gmail.com"
    };

    setTimeout(function () {

        fetch(
            "https://jsonplaceholder.typicode.com/posts",
            {
                method: "POST",

                headers: {
                    "Content-Type":
                        "application/json"
                },

                body:
                    JSON.stringify(user)
            }
        )

            .then(function (response) {
                return response.json();
            })

            .then(function (data) {

                alert("Success");
                console.log(data);
            })

            .catch(function () {

                alert("Failed");
            });

    }, 2000);
}

// ======================================
// EXERCISE 13 - Debugging
// ======================================

function debugRegistration() {

    console.log("Step 1: Form Started");

    debugger;

    console.log("Step 2: Form Submitted");
}

// ======================================
// EXERCISE 14 - jQuery
// ======================================

/*

$(document).ready(function(){

    $("#registerBtn").click(function(){

        alert("Registered");
    });

    $(".eventCard").fadeIn();

    $(".eventCard").fadeOut();

});

*/

// Benefit of React/Vue:
// Reusable components make UI easier to manage.

// ======================================
// FUNCTIONS USED IN YOUR HTML FILE
// ======================================

function showFee() {

    let fee =
    document.getElementById("eventType").value;

    document.getElementById("fee").innerHTML =
    "Event Fee: ₹" + fee;

    localStorage.setItem(
        "selectedFee",
        fee
    );
}

function countCharacters() {

    let text =
    document.getElementById("feedback").value;

    document.getElementById("count").innerHTML =
    text.length;
}

function registerUser() {

    try {

        if (seats <= 0) {
            throw "No Seats Available";
        }

        seats--;

        counter();

        document.getElementById("outputMsg").innerHTML =
        "Registration Successful";

        console.log(
            "Remaining Seats: " + seats
        );

    }

    catch (error) {

        document.getElementById("outputMsg").innerHTML =
        error;
    }
}

function validatePhone() {

    let phone =
    document.getElementById("phone").value;

    let phonePattern =
    /^[0-9]{10}$/;

    if (!phonePattern.test(phone)) {

        alert("Enter Valid 10 Digit Number");
    }
}

function zoomImage() {

    document.getElementById("zoomImage")
        .style.width = "350px";
}

function videoReady() {

    document.getElementById("videoMsg").innerHTML =
    "Video Ready To Play";
}

function clearStorage() {

    localStorage.clear();

    alert("Preferences Cleared");
}

function getLocation() {

    navigator.geolocation.getCurrentPosition(

        function (position) {

            document.getElementById("location").innerHTML =

                "Latitude: " +
                position.coords.latitude +

                "<br>Longitude: " +
                position.coords.longitude;
        }
    );
}

// ======================================
// PAGE LOAD
// ======================================

displayEvents();
fetchEvents();