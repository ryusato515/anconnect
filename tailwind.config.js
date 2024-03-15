module.exports = {
  mode: 'jit', 
  content: [
    './app/views/**/*.html.erb',
    './app/helpers/**/*.rb',
    './app/assets/stylesheets/**/*.css',
    './app/javascript/**/*.js'
  ],
  plugins: [
  ],
  daisyui: {
    themes: [
    ],
  },
  theme: {
    extend: {
      colors: {
        customred: '#562E37',
        customorange: '#D19826',
        customorange_1: '#855B32',
        custompink: '#B19693',
      },
    },
  },
}