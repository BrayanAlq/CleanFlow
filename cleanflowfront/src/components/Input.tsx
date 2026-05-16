interface InputProps {
  className?: string,
  name: string,
  type: string,
  placeholder: string,
  onChange: (e: React.ChangeEvent<HTMLInputElement>) => void,
  value: string,
  errors?: string,
  children?: React.ReactNode,
}

export const Input = ({
  className,
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
    <div className={`flex flex-col h-auto w-full gap-2 text-xs ${className}`}>
      <label className="">{name}</label>
      <input
        type={type}
        className={`${errors ? 'border-red-500' : ''} h-10 rounded-lg border-black border-[0.1px] px-3 py-0 outline-none text-black`}
        placeholder={placeholder}
        onChange={onChange}
        value={value}
      />
      {children}
    </div>
  )
}