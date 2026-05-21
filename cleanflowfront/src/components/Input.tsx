interface InputProps {
  inputStyle?: string,
  labelStyle?: string,
  readonly?: boolean,
  name: string,
  type: string,
  placeholder: string,
  onChange?: (e: React.ChangeEvent<HTMLInputElement>) => void,
  value: string | number,
  errors?: string,
  children?: React.ReactNode,
}

export const Input = ({
  inputStyle,
  labelStyle,
  readonly,
  name,
  type,
  placeholder,
  onChange,
  value,
  errors,
  children,
}: InputProps
) => {
  return (
    <div className={`flex flex-col h-auto w-full gap-2`}>
      <label className={labelStyle}>{name}</label>
      <input
        type={type}
        readOnly={readonly}
        className={`${errors ? 'border-red-500' : ''} h-10 rounded-lg border-[0.1px] px-2 py-0 outline-none text-black ${inputStyle}`}
        placeholder={placeholder}
        onChange={onChange}
        value={value}
      />
      {children}
    </div>
  )
}