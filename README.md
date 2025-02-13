# 🌍 Comprehensive World Countries Database

A detailed collection of information about countries, territories, and dependencies worldwide: this repository provides accurate, up-to-date data in multiple formats (SQL, CSV, and JSON) for easy integration into any project.

## 📊 Data Overview

The database includes comprehensive information about 240 entities, including:
- 193 UN member states
- 2 UN observer states (Vatican City and Palestine)
- 45 territories and dependencies

### 📝 Available Fields

Each entry contains the following information:
- Basic Information:
  - Name
  - ISO codes (2-letter and 3-letter)
  - Geographical classification (continent, region, subregion)
  - Capital city
- Location Data:
  - Latitude and longitude coordinates
- Communication:
  - Phone number prefix (country calling code)
  - Common phone number format
  - Top-level domain (TLD)
- Financial:
  - Currency code (ISO 4217)
  - Currency name
  - Currency symbol
- Visual:
  - Flag emoji (Unicode)
- Metadata:
  - Creation and update timestamps

## 🗃️ Available Formats

1. **SQL**
   - PostgreSQL-compatible schema
   - Includes proper data types and constraints
   - Indexed for optimal query performance

2. **CSV**
   - Clean, comma-separated format
   - UTF-8 encoded
   - Includes header row
   - Ideal for data analysis and spreadsheet applications

3. **JSON**
   - Well-structured and properly nested
   - UTF-8 encoded
   - Perfect for API responses and modern applications

## 🎯 Use Cases

- Web and mobile applications
- Geographic information systems (GIS)
- International business applications
- Telecommunications systems
- Currency conversion tools
- Data analysis and visualization
- Educational resources
- API development

## 🔍 Data Quality

- Verified geographical information
- ISO-standard country codes
- Current currency information
- Accurate phone number formats
- Valid Unicode flag emojis
- Precise coordinate data

## 📦 Installation

Simply clone the repository and choose the format that best suits your needs:

```bash
git clone https://github.com/ceexon/countries.git
```

## 🚀 Usage Examples

### SQL
```sql
-- Get all European countries and their currencies
SELECT name, currency_code, currency_symbol 
FROM countries 
WHERE continent = 'Europe';
```

### CSV (Python Example)
```python
import pandas as pd

# Read the CSV file
df = pd.read_csv('countries.csv')

# Get all countries using USD
usd_countries = df[df['currency_code'] == 'USD']
```

### JSON (JavaScript Example)
```javascript
fetch('countries.json')
  .then(response => response.json())
  .then(data => {
    // Get all countries in Asia
    const asianCountries = data.filter(country => 
      country.continent === 'Asia'
    );
  });
```

## 🔄 Updates

The database is regularly maintained to ensure accuracy. Each record includes timestamps for the creation and the last update.

## 📜 License

This dataset is licensed under the MIT License. Feel free to use it in your projects, both personal and commercial.
