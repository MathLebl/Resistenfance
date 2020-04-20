require("@rails/ujs").start()
require("@rails/activestorage").start()
require("channels")

import "bootstrap";

import { eventListener } from './message_creator.js'
// import { recordAudio } from './sound_recorder.js'

if (window.location.pathname.endsWith('/audio_messages')) {
  console.log('bonjour');
  eventListener();
}

if (window.location.pathname.endsWith('/audio_messages/new')) {
  console.log("create audio message");
  recordAudio();
}
