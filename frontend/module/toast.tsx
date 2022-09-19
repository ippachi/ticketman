import { Fragment } from "react";
import reactHotToast, {
  Toaster as ReactHotToastToaster,
  ToasterProps as ReactHotToastToasterProps,
  useToaster,
} from "react-hot-toast";

export const toast = (text: string, type: "info" | "success" | "error") => {
  const alertType = { info: "alert-info", success: "alert-success", error: "alert-error" }[type];
  reactHotToast.custom(<div className={`alert ${alertType}`}>{text}</div>);
};

export const Toaster = ({ position }: ToasterProps) => {
  const {
    toasts,
    handlers: { startPause, endPause },
  } = useToaster();
  return (
    <div className="toast">
      {toasts.map((toast) => (
        <Fragment key={toast.id}>{toast.message as any}</Fragment>
      ))}
    </div>
  );
};

export type ToasterProps = ReactHotToastToasterProps;
