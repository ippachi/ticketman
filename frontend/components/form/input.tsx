import { ComponentPropsWithoutRef, ForwardedRef, forwardRef } from "react";

const Input = forwardRef(
  ({ id, onChange, onBlur, name }: ComponentPropsWithoutRef<"input">, ref: ForwardedRef<HTMLInputElement>) => {
    return (
      <input
        type="text"
        id={id}
        className="input input-bordered max-w-xs"
        ref={ref}
        name={name}
        onChange={onChange}
        onBlur={onBlur}
      />
    );
  }
);

Input.displayName = "Input";
export default Input;
