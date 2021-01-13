import React from 'react';

import './button.css';

export interface ButtonProps {
  /**
   * Is this the principal call to action on the page?
   */
  primary?: boolean;
  /**
   * What background color to use
   */
  backgroundColor?: string;
  /**
   * text color to use
   */
  color?: string;
  /**
   * width of button
   */
  width?: string;
  /**
   * How large should the button be?
   */
  size?: 'small' | 'medium' | 'large';
  /**
   * Button contents
   */
  label: string;
  /**
   * Optional click handler
   */
  onClick?: () => void;
   /**
   * custom class optional
   */
  customClass?: string;
}

/**
 * Primary UI component for user interaction
 */
const Button: React.FC<ButtonProps> = ({
  primary = false,
  size = 'medium',
  backgroundColor,
  color,
  label,
  customClass = '',
  width,
  ...props
}) => {
  const mode = primary
    ? 'storybook-button--primary'
    : 'storybook-button--secondary';
  return (
    <button
      type="button"
      className={['storybook-button', `storybook-button--${size}`, mode, customClass].join(
        ' ',
      )}
      style={{ backgroundColor, width, color }}
      {...props}>
      {label}
    </button>
  );
};

export default Button;
