import React from 'react';

const Header = ({title}) => {
    return (
        <div className="container-scroller" style={{ zIndex: 1 }}>
          <nav className="navbar col-lg-12 col-12 p-0 fixed-top d-flex flex-row">
            <div className="navbar-brand-wrapper d-flex justify-content-center">
            <div className="navbar-brand-inner-wrapper d-flex align-items-center w-100">
              <button
                className="navbar-toggler navbar-toggler align-self-center mr-4"
                type="button"
                onClick={() => {
                }}
              >
                Nav
              </button>
            </div>
          </div>

            <div className="navbar-menu-wrapper d-flex align-items-center justify-content-end">
                <ul className="navbar-nav ml-4 mr-lg-4 w-100">
                    <li className="nav-item nav-search d-none d-lg-block w-100 title-page">
                        Dashboard
                    </li>
                    <li className="nav-item nav-search d-none d-lg-block w-100 title-page">
                        PACKETS
                    </li>
                    <li className="nav-item nav-search d-none d-lg-block w-100 title-page">
                        TEAM PACKETS
                    </li>
                </ul>

                <ul className="navbar-nav navbar-nav-right">
                    <li>Admin</li>
                    <li>Profile</li>
                </ul>
          </div>
        </nav>
      </div>
    )
}

export default Header;