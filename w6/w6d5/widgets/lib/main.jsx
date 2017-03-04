import React from 'react';
import Tabs from "./tabs";
import Clock from "./clock";

const testTabs = [
  {title: "111", content: "1111111111111111"},
  {title: "222", content: "2222222222222222"}
];

const Main = () => (
  <main className="main">
    <Tabs testTabs={testTabs}/>
    <Clock />
  </main>
);

export default Main;
