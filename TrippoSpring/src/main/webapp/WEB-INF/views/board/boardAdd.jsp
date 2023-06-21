<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Create New Post</title>
    <script>
        // Define an object with country-city mappings
        var cityMap = {
            "USA": ["New York", "Los Angeles", "Chicago"],
            "Canada": ["Toronto", "Vancouver", "Montreal"],
            "UK": ["London", "Manchester", "Edinburgh"]
            // Add more country-city mappings here
        };

        // Function to update the city dropdown based on the selected country
        function updateCityDropdown() {
            var countrySelect = document.getElementById("country");
            var citySelect = document.getElementById("city");
            var selectedCountry = countrySelect.options[countrySelect.selectedIndex].value;
            var cities = cityMap[selectedCountry];

            // Clear existing options
            citySelect.innerHTML = "";

            // Populate city options
            for (var i = 0; i < cities.length; i++) {
                var option = document.createElement("option");
                option.value = cities[i];
                option.text = cities[i];
                citySelect.appendChild(option);
            }
        }
    </script>
</head>
<body>
    <h1>Create New Post</h1>
    <form action="${pageContext.request.contextPath}/newPost" method="post" enctype="multipart/form-data">
        <label for="title">Title:</label>
        <input type="text" id="title" name="title" required>
        <br><br>
        <label for="content">Content:</label>
        <textarea id="content" name="content" rows="5" required></textarea>
        <br><br>
        <label for="image">Image:</label>
        <input type="file" id="image" name="image" accept="image/*">
        <br><br>
        <label for="country">Country:</label>
        <select id="country" name="country" onchange="updateCityDropdown()">
            <option value="USA">USA</option>
            <option value="Canada">Canada</option>
            <option value="UK">UK</option>
            <!-- Add more country options here -->
        </select>
        <br><br>
        <label for="city">City:</label>
        <select id="city" name="city"></select>
        <br><br>
        <input type="submit" value="Create">
    </form>
</body>
</html>
