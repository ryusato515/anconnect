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
        customred: '#64363C',
        customorange: '#D19826',
        customorange_1: '#DAC9A6',
        custompink: '#B19693',
        custompink_1: '#D7C4BB',
        customgreen: '#90B44B',
        customgreen_1: '#1B813E',
        customgreen_2: '#B5CAA0',
        custompink_1: '#FEDFE1'
      },
      width: {
        '1/8': '12.5%',
      },
    },
  },
}