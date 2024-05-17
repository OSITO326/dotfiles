// CONSTANTS
const fs = require('fs');
const path = require('path');
const os = require('os');

const ID = '3919968';
const API_KEY = ''; // YOUR API KEY HERE
const UNITS = 'metric';
const LANG = 'es';
const URL = `https://api.openweathermap.org/data/2.5/weather?id=${ID}&lang=${LANG}&appid=${API_KEY}&units=${UNITS}`;

// GET API
fetchWeatherData = async () => {
  try {
    const response = await fetch(URL);
    if (response.status === 200) {
      const { name, main, weather, sys } = await response.json();
      return {
        city: name,
        temperature: main.temp,
        feels_like: main.feels_like,
        humidity: main.humidity,
        id: weather[0].id,
        icon: weather[0].icon,
        main: weather[0].main,
        description: weather[0].description,
        country: sys.country,
      };
    } else {
      throw new Error('Failed to fetch weather data');
    }
  } catch (error) {
    console.error('Error fetching weather data:', error);
    return null;
  }
};

// Save data to file .json
const saveData = async () => {
  try {
    // Call fetchWeatherData to get the weather data
    const data = await fetchWeatherData();
    // If data is not null, save it to the file
    if (data) {
      // Get the path to save data
      const filePath = path.join(
        os.homedir(),
        '.cache',
        'eww',
        'weather',
        'weather.json',
      );
      // Convert data to JSON and save it to the file
      fs.writeFileSync(filePath, JSON.stringify(data, null, 2));
    }
  } catch (error) {
    console.error('Error saving data:', error);
  }
};

// Result --savedata from file weather.json ($HOME/.cache/eww/weather/weather.json)
// {
//   "city": "Cochabamba",
//   "temperature": 18.86,
//   "feels_like": 17.9,
//   "humidity": 42,
//   "id": 800,
//   "icon": "01n",
//   "main": "Clear",
//   "description": "cielo claro",
//   "country": "BO"
// }

// Get weather data from file .json
const getWeatherFromJSON = () => {
  const filePath = path.join(
    os.homedir(),
    '.cache',
    'eww',
    'weather',
    'weather.json',
  );
  try {
    if (fs.existsSync(filePath)) {
      // Verificar si el archivo existe
      const data = fs.readFileSync(filePath, 'utf-8');
      return JSON.parse(data);
    } else {
      // console.log('El archivo weather.json no existe');
      return null;
    }
  } catch (error) {
    console.error('Error reading weather data from JSON:', error);
    return null;
  }
};

const weatherData = getWeatherFromJSON();

// First letter to uppercase (CapitalCase)
const capitalizeFirstWord = (str) => {
  return str.charAt(0).toUpperCase() + str.slice(1);
};

// Print the name of the city
const printCityCountry = () => {
  if (weatherData) {
    const { city, country } = weatherData;
    const location = 'Bolivia';
    if (country == 'BO') return console.log(`${city}, ${location}`);
  }
};

// Print the temperature of the city
const printTemperature = () => {
  if (weatherData) {
    let { temperature } = weatherData;
    temperature = parseFloat(temperature);
    temperature = Math.round(temperature);
    return console.log(temperature + '°C');
  }
};

// Print extra stats
const printExtraStats = () => {
  if (weatherData) {
    let { feels_like, humidity } = weatherData;
    feels_like = parseFloat(feels_like);
    feels_like = Math.floor(feels_like);
    let tabSpace = '  '; // tab as 2 spaces
    return console.log(
      `SENSACIÓN\n${tabSpace}\uf2c7 ${feels_like}°C\nHUMEDAD\n${tabSpace}\ue373 ${humidity}%`,
    );
  }
};

// Print weather icon
// https://openweathermap.org/weather-conditions
const printWeatherIcon = () => {
  if (!weatherData) return;
  const icons = {
    // Group 2xx: Thunderstorm
    '200-11d': '',
    '201-11d': '',
    '202-11d': '',
    '210-11d': '',
    '211-11d': '',
    '212-11d': '',
    '221-11d': '',
    '230-11d': '',
    '231-11d': '',
    '232-11d': '',
    // Group 3xx: Drizzle
    '300-09d': '',
    '301-09d': '',
    '302-09d': '',
    '310-09d': '',
    '311-09d': '',
    '312-09d': '',
    '313-09d': '',
    '314-09d': '',
    '321-09d': '',
    // Group 5xx: Rain
    '500-10d': '',
    '501-10d': '',
    '502-10d': '',
    '503-10d': 'j',
    '504-10d': '',
    '511-13d': '',
    '520-09d': '',
    '521-09d': '',
    '522-09d': '',
    '531-09d': '',
    // Group 6xx: Snow
    '600-13d': '',
    '601-13d': '',
    '602-13d': '',
    '611-13d': '',
    '612-13d': '',
    '613-13d': '',
    '615-13d': '',
    '616-13d': '',
    '620-13d': '',
    '621-13d': '',
    '622-13d': '',
    // Group 7xx: Atmosphere
    '701-50d': '',
    '711-50d': '',
    '721-50d': '',
    '731-50d': '',
    '741-50d': '',
    '751-50d': '',
    '761-50d': '',
    '762-50d': '',
    '771-50d': '',
    '781-50d': '',
    // Group 800: Clear
    '800-01d': '',
    '800-01n': '',
    // Group 80x: Clouds
    '801-02d': '',
    '801-02n': '',
    '802-03d': '',
    '802-03n': '',
    '803-04d': '',
    '803-04n': '',
    '804-05d': '',
    '804-05n': '',
  };
  const { id, icon } = weatherData;
  const key = `${id}-${icon}`;
  const weatherIcon = icons[key];
  if (weatherIcon) return console.log(weatherIcon);
};

// Print quote weather by icon
const printQuote = () => {
  const quotes = {
    '50d': 'El pronóstico dice que hay niebla',
    '50n': 'El pronóstico dice que es una noche brumosa.',
    '01d': '¡Es un día soleado, será divertido!',
    '01n': 'Es una noche clara',
    '02d': 'Está nublado, algo sombrío.',
    '02n': 'Es una noche nublada',
    '03d': 'Está nublado, algo sombrío.',
    '03n': 'Es una noche nublada',
    '04d': 'Está nublado, algo sombrío.',
    '04n': 'Es una noche nublada',
    '09d': '¡Está lloviendo, es un gran día',
    '09n': 'Parece que va a llover esta noche.',
    '10d': '¡Está lloviendo, es un gran día',
    '10n': 'Parece que va a llover esta noche.',
    '11d': 'Hoy se pronostica tormenta',
    '11n': 'Esta noche habrá tormentas',
    '13d': 'Va a nevar hoy',
    '13n': 'Va a nevar esta noche',
    '40d': 'El pronóstico dice que hay niebla.',
    '40n': 'El pronóstico dice que es una noche brumosa',
  };

  const { icon } = weatherData;
  const quote = quotes[icon];
  if (quote) console.log(quote);
};

const printQuoteTwo = () => {
  const quotes = {
    '50d': 'Asegúrate de no perderte en el camino...',
    '50n': 'No vayas a ningún lado esta noche o podrías perderte...',
    '01d': 'Pero no vayas a vagar solo...',
    '01n': 'Quizás quieras dar un paseo nocturno para relajarte...',
    '02d': 'Será mejor que consigas un libro para leer...',
    '02n': '¿Qué tal un chocolate caliente y una cama calentita?',
    '03d': 'Será mejor que consigas un libro para leer...',
    '03n': '¿Qué tal un chocolate caliente y una cama calentita?',
    '04d': 'Será mejor que consigas un libro para leer...',
    '04n': '¿Qué tal un chocolate caliente y una cama calentita?',
    '09d': 'Consigue un poco de ramen y mira cómo cae la lluvia...',
    '09n': 'Asegúrate de que tu ropa no esté todavía afuera...',
    '10d': 'Consigue un poco de ramen y mira cómo cae la lluvia...',
    '10n': 'Asegúrate de que tu ropa no esté todavía afuera...',
    '11d': 'Asegúrate de no quedarte impresionado...',
    '11n':
      'Asegúrate de estar abrigado en la cama y que las ventanas estén cerradas...',
    '13d':
      '¡Será mejor que uses ropa gruesa y hagas un muñeco de nieve también!',
    '13n':
      'Asegúrate de levantarte temprano mañana para ver los lugares de interés...',
    '40d': 'Asegúrate de no perderte en el camino...',
    '40n': 'No vayas a ningún lado esta noche o podrías perderte...',
  };

  const { icon } = weatherData;
  const quote = quotes[icon];
  if (quote) console.log(quote);
};

// Print weather main
const printMain = () => {
  if (weatherData) {
    const { main } = weatherData;
    const mainWeather = capitalizeFirstWord(main);
    return console.log(mainWeather);
  }
};

// Print weather description
const printDescription = () => {
  if (weatherData) {
    const { description } = weatherData;
    const desc = capitalizeFirstWord(description);
    return console.log(desc);
  }
};

const args = process.argv.slice(2);
if (args.includes('--fetch')) {
  fetchWeatherData().then((data) => console.log(data));
} else if (args.includes('--savedata')) {
  saveData();
} else if (args.includes('--country')) {
  printCityCountry();
} else if (args.includes('--temp')) {
  printTemperature();
} else if (args.includes('--extrastats')) {
  printExtraStats();
} else if (args.includes('--icon')) {
  printWeatherIcon();
} else if (args.includes('--main')) {
  printMain();
} else if (args.includes('--desc')) {
  printDescription();
} else if (args.includes('--quote')) {
  printQuote();
} else if (args.includes('--quote2')) {
  printQuoteTwo();
} else {
  console.log('Please provide a valid argument');
}
