#[cfg(test)]
mod tests {
    #[test]
    fn suma() {
        let result = 2 + 2;
        assert(result == 4, 'El resultado no es 4');
    }

    #[test]
    fn resta() {
        let result = 2 - 2;
        assert(result == 0, 'El resultado no es 0');
    }
   
    #[test]
    fn multiplicacion() {
        let result = 2 * 5 * 2;
        assert(result == 20, 'El resultado no es 20');
    }
}