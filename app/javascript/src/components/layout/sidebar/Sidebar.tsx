import './sidebar.css';

import React, { useState } from 'react';
import { Layout, Menu } from 'antd';

const { Sider } = Layout;
import {
    DesktopOutlined,
    HomeOutlined,
    ProfileOutlined,
    TeamOutlined,
    UserOutlined,
    MenuOutlined
  } from '@ant-design/icons';
const { SubMenu } = Menu;

const Sidebar = () => {
    const [ collapsed, setCollapsed ] = useState(false);

    const onCollapse = () => {
        setCollapsed(!collapsed);
    }

    return (
      <Sider className="app-sidebar"  trigger={null} collapsible collapsed={collapsed}>

        <Menu className="app-sidebar-menu" defaultSelectedKeys={['1']} mode="inline">
          <Menu.Item className="menu" icon={<MenuOutlined />} onClick={onCollapse}></Menu.Item>
          <SubMenu key="sub1" icon={<HomeOutlined />} title="Dashboard">
            <Menu.Item key="1">Task List</Menu.Item>
            <Menu.Item key="2">Activity Feed</Menu.Item>
          </SubMenu>
          <SubMenu key="sub2" icon={<DesktopOutlined />} title="My Packets">
            <Menu.Item key="3">Active Packets</Menu.Item>
            <Menu.Item key="4">Unsent Packets</Menu.Item>
            <Menu.Item key="5">Past Packets</Menu.Item>
          </SubMenu>
          <SubMenu key="sub3" icon={<TeamOutlined />} title="Team Packets">
            <Menu.Item key="6">Approval Needed</Menu.Item>
            <Menu.Item key="7">Past Packets</Menu.Item>
          </SubMenu>
          <SubMenu key="sub4" icon={<UserOutlined />} title="Admin">
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
          <Menu.Item key="15" icon={<ProfileOutlined />}>
            Profile
          </Menu.Item>
        </Menu>
      </Sider>
    )
};

export default Sidebar;