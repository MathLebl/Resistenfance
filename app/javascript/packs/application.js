require("@rails/ujs").start()
require("@rails/activestorage").start()
require("channels")

import "bootstrap";

import { eventListener } from './message_creator.js'
if (window.location.pathname.startsWith('/audio_messages')) {
  console.log('bonjour');
}
eventListener();
