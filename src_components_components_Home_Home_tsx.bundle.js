"use strict";
/*
 * ATTENTION: The "eval" devtool has been used (maybe by default in mode: "development").
 * This devtool is neither made for production nor for readable output files.
 * It uses "eval()" calls to create a separate source file in the browser devtools.
 * If you are trying to read the output file, select a different devtool (https://webpack.js.org/configuration/devtool/)
 * or disable the default devtool with "devtool: false".
 * If you are looking for production-ready output files, see mode: "production" (https://webpack.js.org/configuration/mode/).
 */
(self["webpackChunkwebpack_react_ts"] = self["webpackChunkwebpack_react_ts"] || []).push([["src_components_components_Home_Home_tsx"],{

/***/ "./src/components/components/Home/Home.tsx":
/*!*************************************************!*\
  !*** ./src/components/components/Home/Home.tsx ***!
  \*************************************************/
/***/ (function(__unused_webpack_module, __webpack_exports__, __webpack_require__) {

eval("__webpack_require__.r(__webpack_exports__);\n/* harmony import */ var react__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! react */ \"./node_modules/react/index.js\");\n/* harmony import */ var react__WEBPACK_IMPORTED_MODULE_0___default = /*#__PURE__*/__webpack_require__.n(react__WEBPACK_IMPORTED_MODULE_0__);\n\nconst Home = () => {\n    const [arr, setArr] = (0,react__WEBPACK_IMPORTED_MODULE_0__.useState)([]);\n    return (react__WEBPACK_IMPORTED_MODULE_0___default().createElement((react__WEBPACK_IMPORTED_MODULE_0___default().Fragment), null,\n        react__WEBPACK_IMPORTED_MODULE_0___default().createElement(\"p\", null, \"Hello World of React and Webpack!\"),\n        react__WEBPACK_IMPORTED_MODULE_0___default().createElement(\"button\", { type: \"button\", onClick: () => setArr(prev => [...prev,\n                Math.floor(Math.random() * 100) + 1]) }, \"Click Me!!!\"),\n        react__WEBPACK_IMPORTED_MODULE_0___default().createElement(\"p\", { \"data-testid\": \"numlist\" }, arr.join(','))));\n};\n/* harmony default export */ __webpack_exports__[\"default\"] = (Home);\n\n\n//# sourceURL=webpack://webpack-react-ts/./src/components/components/Home/Home.tsx?");

/***/ })

}]);