import { FieldError } from "react-hook-form";

export default function InputError({ error }: { error: FieldError | undefined }): JSX.Element {
  return (
    <>
      {error && (
        <label className="label">
          <span className="label-text-alt text-error">{error.message}</span>
        </label>
      )}
    </>
  );
}
