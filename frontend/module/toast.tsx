import { Fragment } from "react";
import reactHotToast, { ToasterProps as ReactHotToastToasterProps, useToaster } from "react-hot-toast";

export const toast = (text: string, type: "info" | "success" | "error"): void => {
  const alertType = { info: "alert-info", success: "alert-success", error: "alert-error" }[type];
  reactHotToast.custom(<div className={`alert ${alertType}`}>{text}</div>);
};

export const Toaster = (): JSX.Element => {
  const { toasts } = useToaster();
  return (
    <div className="toast">
      {toasts.map((toast) => (
        <Fragment key={toast.id}>{toast.message as JSX.Element}</Fragment>
      ))}
    </div>
  );
};

export type ToasterProps = ReactHotToastToasterProps;
