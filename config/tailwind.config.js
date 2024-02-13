const defaultTheme = require('tailwindcss/defaultTheme')

module.exports = {
  content: [
    './public/*.html',
    './app/helpers/**/*.rb',
    './app/javascript/**/*.js',
    './app/views/**/*.{erb,haml,html,slim}'
  ],
  darkMode: 'class',
  theme: {
    extend: {
      fontFamily: {
        sans: ['Inter var', ...defaultTheme.fontFamily.sans],
      },
      fontSize: {
        '2xs': '.625rem',
      },
      colors: {
        background: {
          light: '#F9FAFB',
          dark: '#171717'
        },
        border: {
          light: '#E5E7EB',
          dark: '#1A1A1C'
        },
        heading: {
          light: '#262626',
          dark: '#a3a3a3'
        },
        highlight: {
          light: '#eaeaea',
          dark: '#262626'
        },
        offwhite: '#F9FAFB'
      },
      dropShadow: {
        'form': '0px 4px 10px rgba(52, 54, 60, 0.08)',
      },
      boxShadow: {
        'xs': '0px 1px 2px 0px #1018280D'
      }
    },
  },
  options: {
    safelist: ['dark', 'light']
  },
  plugins: [
    require('@tailwindcss/forms'),
    require('@tailwindcss/aspect-ratio'),
    require('@tailwindcss/typography'),
    require('@tailwindcss/container-queries'),
  ]
}
