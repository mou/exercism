export function valid(digitString: string): boolean {

    if (!/^[\d ]+$/.test(digitString) || digitString.replace(' ', '').length <= 1) {
        return false
    }

    const sum = [...digitString].filter(d => /\d/.test(d))
        .reverse()
        .map(d => Number(d))
        .map((d, i) => i % 2 === 0 ? d : d * 2 > 9 ? d * 2 - 9 : d * 2)
        .reduce((sum, d) => sum + d, 0)

    return sum % 10 === 0
}

