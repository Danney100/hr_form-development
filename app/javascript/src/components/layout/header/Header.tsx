import './header.css';
import React from 'react';
import {  Menu } from 'antd';
import IconLogo from 'assets/images/ui-logo.svg';

const Header = () => {
    return (
      <header className="ant-layout-header app-header">
        <div style={{display: 'flex'}}>
          <div className="logo" >
            <img src={IconLogo} width="50" height="50"/>
          </div>
          <Menu className="nav-list" theme="light" mode="horizontal" defaultSelectedKeys={['2']}>
            <Menu.Item className="nav-item" key="1">DASHBOARD</Menu.Item>
            <Menu.Item className="nav-item" key="2">PACKETS</Menu.Item>
            <Menu.Item className="nav-item" key="3">TEAM PACKETS</Menu.Item>
            <Menu.Item className="nav-item" key="4">ADMIN</Menu.Item>
            <Menu.Item className="nav-item" key="5">PROFILE</Menu.Item>
          </Menu>
        </div>

      </header>
    )
}

export default Header;