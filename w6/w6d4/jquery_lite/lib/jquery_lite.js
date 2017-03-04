/******/ (function(modules) { // webpackBootstrap
/******/ 	// The module cache
/******/ 	var installedModules = {};

/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {

/******/ 		// Check if module is in cache
/******/ 		if(installedModules[moduleId])
/******/ 			return installedModules[moduleId].exports;

/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = installedModules[moduleId] = {
/******/ 			i: moduleId,
/******/ 			l: false,
/******/ 			exports: {}
/******/ 		};

/******/ 		// Execute the module function
/******/ 		modules[moduleId].call(module.exports, module, module.exports, __webpack_require__);

/******/ 		// Flag the module as loaded
/******/ 		module.l = true;

/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}


/******/ 	// expose the modules object (__webpack_modules__)
/******/ 	__webpack_require__.m = modules;

/******/ 	// expose the module cache
/******/ 	__webpack_require__.c = installedModules;

/******/ 	// identity function for calling harmony imports with the correct context
/******/ 	__webpack_require__.i = function(value) { return value; };

/******/ 	// define getter function for harmony exports
/******/ 	__webpack_require__.d = function(exports, name, getter) {
/******/ 		if(!__webpack_require__.o(exports, name)) {
/******/ 			Object.defineProperty(exports, name, {
/******/ 				configurable: false,
/******/ 				enumerable: true,
/******/ 				get: getter
/******/ 			});
/******/ 		}
/******/ 	};

/******/ 	// getDefaultExport function for compatibility with non-harmony modules
/******/ 	__webpack_require__.n = function(module) {
/******/ 		var getter = module && module.__esModule ?
/******/ 			function getDefault() { return module['default']; } :
/******/ 			function getModuleExports() { return module; };
/******/ 		__webpack_require__.d(getter, 'a', getter);
/******/ 		return getter;
/******/ 	};

/******/ 	// Object.prototype.hasOwnProperty.call
/******/ 	__webpack_require__.o = function(object, property) { return Object.prototype.hasOwnProperty.call(object, property); };

/******/ 	// __webpack_public_path__
/******/ 	__webpack_require__.p = "";

/******/ 	// Load entry module and return exports
/******/ 	return __webpack_require__(__webpack_require__.s = 0);
/******/ })
/************************************************************************/
/******/ ([
/* 0 */
/***/ (function(module, exports, __webpack_require__) {

const DomNodeCollection = __webpack_require__(1);

window.$l = function (arg) {
  if (arg instanceof HTMLElement) {
    return new DomNodeCollection([arg])
  } else {
    return selectElements(arg);
  }
};

function selectElements(arg) {
  const array = Array.from(document.querySelectorAll(arg));
  return new DomNodeCollection(array);
}

function titleChanger() {
  setInterval(() => {
    $l('h1').addClass('fancy');
    setTimeout(() => {
      $l('h1').removeClass('fancy');
    }, 500);
  }, 1000);
}

// titleChanger();


/***/ }),
/* 1 */
/***/ (function(module, exports) {

class DomNodeCollection {
  constructor(collection) {
    this.collection = collection;
  }

  html(string) {
    if (string !== undefined) {
      this.collection.forEach(el => el.innerHTML = string);
    } else {
      return this.collection[0].innerHTML;
    }
  }

  empty() {
    this.html('');
  }

  append(element) {
    if (element instanceof DomNodeCollection) {
      this._domToDom(element);
    } else if (element instanceof HTMLElement) {
      this._htmlToDom(element);
    } else if (typeof element === 'string') {
      this._appendText(element);
    }
  }

  addClass(className) {
    this.collection.forEach(el => {
      el.classList.add(className);
    })
  }

  removeClass(className) {
    this.collection.forEach(el => {
      el.classList.remove(className);
    })
  }

  _domToDom(nodes) {
    this.collection.forEach(el => {
      nodes.collection.forEach(node => {
        el.appendChild(node);
      });
    });
  }

  _htmlToDom(element) {
    this._domToDom(new DomNodeCollection([element]));
  }

  _appendText(element) {
    this.collection.forEach(el => {
      const inner = el.innerHTML;
      el.innerHTML = inner + element;
    });
  }

}

module.exports = DomNodeCollection;


/***/ })
/******/ ]);