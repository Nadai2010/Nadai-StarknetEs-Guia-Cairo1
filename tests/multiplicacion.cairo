#[cfg(test)]
mod tests {
    #[test]
    fn multiplicacion() {
        let result = 2 * 5 * 2;
        assert(result == 20, 'El resultado no es 20');
    }
}