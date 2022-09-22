import { ChangeEventHandler, FocusEventHandler, ForwardedRef, forwardRef } from "react";
import { FieldError, FieldErrors, FieldErrorsImpl, UseFormReturn } from "react-hook-form";
import Input from "./input";
import InputError from "./input-error";
import Label from "./label";

const InputWithLabel = forwardRef(
  (
    {
      name,
      label,
      onChange,
      onBlur,
      error,
    }: {
      name: string;
      label: string;
      onChange: ChangeEventHandler<HTMLInputElement>;
      onBlur: FocusEventHandler<HTMLInputElement>;
      error: FieldError | undefined;
    },
    ref: ForwardedRef<HTMLInputElement>
  ) => {
    return (
      <>
        <Label htmlFor={name}>{label}</Label>
        <Input name={name} id={name} onChange={onChange} onBlur={onBlur} ref={ref} />
        <InputError error={error} />
      </>
    );
  }
);

export default InputWithLabel;
