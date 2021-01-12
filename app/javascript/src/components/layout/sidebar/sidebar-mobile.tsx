import './sidebar-mobile.css';

import React, { useState } from 'react';
import { Layout, Menu } from 'antd';
import Button from '@/components/button/Button';

const { Sider } = Layout;
const { SubMenu } = Menu;

const Sidebar = () => {

    return (
      <Sider className="app-sidebar"  trigger={null}>
        <Menu className="app-sidebar-menu" defaultSelectedKeys={['1']} mode="inline">
          <SubMenu className="bt bb" key="sub1" title="DASHBOARD">
            <Menu.Item key="1">Task List</Menu.Item>
            <Menu.Item key="2">Activity Feed</Menu.Item>
          </SubMenu>
          <SubMenu className="bb" key="sub2" title="MY PACKETS">
            <Menu.Item key="3">Active Packets</Menu.Item>
            <Menu.Item key="4">Unsent Packets</Menu.Item>
            <Menu.Item key="5">Past Packets</Menu.Item>
          </SubMenu>
          <SubMenu className="bb" key="sub3" title="TEAM PACKETS">
            <Menu.Item key="6">Approval Needed</Menu.Item>
            <Menu.Item key="7">Past Packets</Menu.Item>
          </SubMenu>
          <SubMenu className="bb" key="sub4" title="ADMIN">
            <Menu.Item key="8">Active Users</Menu.Item>
            <Menu.Item key="9">Reporting</Menu.Item>
            <SubMenu key="subsub1" title="Organization">
              <Menu.Item key="10">Org Details</Menu.Item>
              <Menu.Item key="11">Approver Paths</Menu.Item>            
              <Menu.Item key="12">Form Packets</Menu.Item>
              <Menu.Item key="13">User Requests</Menu.Item>
              <Menu.Item key="14">Removed Users</Menu.Item>
            </SubMenu>
          </SubMenu>
          <Menu.Item className="bb" key="15">
            PROFILE
          </Menu.Item>
        </Menu>
        <Button customClass="logout" label="LOG OUT" />
      </Sider>
    )
};

export default Sidebar;