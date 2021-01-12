import { mount, shallow } from 'enzyme';
import React from 'react';

import Button from '../Button';

describe('Button Component', () => {
  it('accepts the label prop', () => {
    const wrapper = mount(<Button label="My Button" />);
    expect(wrapper.props().label).toEqual('My Button');
  });

  it('renders the correct label value in the HTML', () => {
    const wrapper = mount(<Button label="My Button" />);
    const value = wrapper.find('button').text();
    expect(value).toEqual('My Button');
  });

  it('accepts the size prop', () => {
    const wrapper = mount(<Button label="My Button" size="medium" />);
    expect(wrapper.props().size).toEqual('medium');
  });

  it('accepts the backgroundColor prop', () => {
    const wrapper = mount(
      <Button label="My Button" backgroundColor={'white'} />,
    );
    expect(wrapper.props().backgroundColor).toEqual('white');
  });
});
