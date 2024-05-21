module.exports = {
  mode: 'jit', 
  content: [
    './app/views/**/*.html.erb',
    './app/helpers/**/*.rb',
    './app/assets/stylesheets/**/*.css',
    './app/javascript/**/*.js',
    './app/helpers/*.rb'
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
        customgreen: '#90B44B',
        customgreen_1: '#1B813E',
        custompink_1: '#FEDFE1'
      },
      width: {
        '1/8': '12.5%',
      },
    },
  },
}