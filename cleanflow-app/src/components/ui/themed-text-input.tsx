import { useTheme } from '@/hooks/use-theme'
import { StyleSheet, TextInput } from 'react-native'

interface IInputProps {
  value: string
  onChangeValue: (text: string) => void
  placeholder: string
  autoCapitalize?: 'none' | 'sentences' | 'words' | 'characters'
  keyboardType?: 'default' | 'email-address' | 'numeric' | 'phone-pad'
  pattern?: RegExp
}

export const ThemedTextInput = ({
  value,
  onChangeValue,
  placeholder,
  autoCapitalize,
  keyboardType,
  pattern,
}: IInputProps) => {
  const theme = useTheme()

  const isValid = pattern ? pattern.test(value) : true
  const isError = value.length > 0 && !isValid
  const borderColor = isError ? theme.borderError : theme.borderColor

  return (
    <TextInput
      style={[
        styles.input,
        {
          backgroundColor: theme.background,
          color: theme.text,
          borderWidth: 1,
          borderColor: borderColor,
        },
      ]}
      placeholder={placeholder}
      placeholderTextColor={theme.text}
      value={value}
      onChangeText={text => onChangeValue(text)}
      autoCapitalize={autoCapitalize}
      keyboardType={keyboardType}
    />
  )
}

const styles = StyleSheet.create({
  input: {
    padding: 14,
    borderRadius: 14,
    marginBottom: 12,
    fontSize: 16,
    elevation: 1,
    shadowColor: '#000',
    shadowOpacity: 0.03,
    shadowRadius: 3,
    shadowOffset: { width: 0, height: 1 },
  },
})
