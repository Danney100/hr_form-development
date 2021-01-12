import './sidebar-desktop.css';
import React, { useState } from 'react';
import {  Menu, Layout } from 'antd';
const { Sider } = Layout;
import IconClose from 'assets/images/ui-icons-x-standard.svg';
import IconInformation from 'assets/images/ui-icons-information-light.svg';
import IconForm from 'assets/images/ui-icons-forms-dark.svg';
import IconApprove from 'assets/images/ui-icons-approver-dark.svg';
import IconStatus from 'assets/images/ui-icons-status-dark.svg';

const SidebarDesktop = () => {

    return (
      <div className="app-sidebar-desktop">
        <Sider className="app-sidebar-sider" width={127}>
            <Menu className="app-sidebar-menu" defaultSelectedKeys={['1']} mode="inline">
                <Menu.Item key="0" className="menu menu-close">
                    <img src={IconClose} width="14" height="14" style={{ marginRight:'5px'}}/> Close
                </Menu.Item>
                <Menu.Item key="1" className="menu">
                    <div style={{display: 'flex', flexDirection: 'column'}}>
                        <img src={IconInformation} width="35" height="35" className="sidebar-icon"/>
                        <p>Packet Details</p>
                    </div>
                </Menu.Item>
                <Menu.Item key="2" className="menu">
                    <div style={{display: 'flex', flexDirection: 'column'}}>
                        <img src={IconForm} width="35" height="35" className="sidebar-icon"/>
                        <p>Forms</p>
                    </div>
                </Menu.Item>
                <Menu.Item key="3" className="menu">
                    <div style={{display: 'flex', flexDirection: 'column'}}>
                        <img src={IconApprove} width="35" height="35" className="sidebar-icon"/>
                        <p>Approvers</p>
                    </div>
                </Menu.Item>
                <Menu.Item key="4" className="menu">
                    <div style={{display: 'flex', flexDirection: 'column'}}>
                        <img src={IconStatus} width="35" height="35" className="sidebar-icon"/>
                        <p>Status</p>
                    </div>
                </Menu.Item>
            </Menu>
        </Sider>
      </div>
    )
};

export default SidebarDesktop;