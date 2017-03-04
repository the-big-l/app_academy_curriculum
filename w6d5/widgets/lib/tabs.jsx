import React from 'react';
import TabHeader from './tab_header';

class Tabs extends React.Component {
  constructor(props) {
    super(props);
    this.state = {currentTab: 0};
    this.tabTitles = this.props.testTabs.map((tab) => (tab.title));
    this.tabContents = this.props.testTabs.map(tab => tab.content);
    this.tabClicks= this.tabClicks.bind(this);
  }

  render () {
    return (
    <div className="tabs">
      <TabHeader titles={this.tabTitles} tabClicks={this.tabClicks} />

      <article>{this.tabContents[this.state.currentTab]}</article>

    </div>
  );
  }

  tabClicks(idx) {
    const currentTab = idx;
    this.setState({ currentTab });
  }
}

export default Tabs;
