const defaultTheme = require('tailwindcss/defaultTheme')

module.exports = {
  content: [
    './public/*.html',
    './app/helpers/**/*.rb',
    './app/javascript/**/*.js',
    './app/assets/stylesheets/**/*.css',
    './app/views/**/*.{erb,haml,html,slim}'
  ],
  theme: {
    extend: {
      fontFamily: {
        sans: ['Inter var', ...defaultTheme.fontFamily.sans],
      },
      colors: {
        'deep-sky': '#187fc4',
        'default-black': '#333',
        'active-yellow': '#fff9b1',
        'category-1': '#ff4500',
        'category-2': '#008080',
        'category-3': '#4169e1',
        'category-4': '#c71585',
        'category-5': '#20b2aa',
        'category-6': '#483d8b'
      },
    },
  },
  plugins: [
    require('@tailwindcss/forms'),
    require('@tailwindcss/aspect-ratio'),
    require('@tailwindcss/typography'),
    require('@tailwindcss/line-clamp'),
    require('@tailwindcss/container-queries'),
  ]
}
