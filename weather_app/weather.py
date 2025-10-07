import requests

def get_weather(city):
    API_KEY = "e2ecfd34ce9577f40d27383d3ec09980"  # Replace the text with the actual key
    BASE_URL = "https://api.openweathermap.org/data/2.5/weather"

    params = {"q": city, "appid": API_KEY, "units": "metric"}  # metric = °C

    response = requests.get(BASE_URL, params=params)

    if response.status_code == 200:
        data = response.json()
        main = data["weather"][0]["main"]
        description = data["weather"][0]["description"]
        temp = data["main"]["temp"]
        feels_like = data["main"]["feels_like"]
        humidity = data["main"]["humidity"]

        print(f"\n🌤️ Weather in {city.title()}")
        print(f"Condition: {main} ({description})")
        print(f"Temperature: {temp}°C (feels like {feels_like}°C)")
        print(f"Humidity: {humidity}%\n")
    else: 
        print("\n❌ Error: City not found or invalid API key.\n")

def main():
    print("=== Weather App ===")
    while True:
        city = input("Enter a city name (or 'q' to quit): ")
        if city.lower() == "q":
            break
        get_weather(city)

if __name__ == "__main__":
    main() 
